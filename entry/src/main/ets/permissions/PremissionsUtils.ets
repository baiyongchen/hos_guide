/*
* a:byc
* time:2024/4/11
* des:权限工具文件
*/
import common from '@ohos.app.ability.common';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { tagMsg } from '../pages/wan/utils/Logger';
import bundleManager from '@ohos.bundle.bundleManager';


/**
 * 申请权限
 * 系统可以批量申请
 * 自定义的单独申请
 * @param permissions
 */
export async function reqPermissionsFromUser(permission: Permissions): Promise<boolean> {
  let context = getContext(this) as common.UIAbilityContext;
  let atManager = abilityAccessCtrl.createAtManager();
  let permissions: Permissions[] = [permission];
  // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
  return new Promise<boolean>((resolve, reject) => {
    atManager.requestPermissionsFromUser(context, permissions).then((data) => {
      //限制申请一个权限所以取第一个就可以了
      let grantStatus: Array<number> = data.authResults;
      if (grantStatus.length == 0) {
        resolve(false);
      } else {
        if (grantStatus[0] == abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
          resolve(true);
        } else {
          resolve(false);
        }
      }
      /*let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }*/
    }).catch((err) => {
      resolve(false);
    })
  });
}

/**
 * 校验具体权限状态(授权/非授权)
 * @param permission 具体权限
 * @returns 当前权限状态
 */
export async function checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
  let atManager = abilityAccessCtrl.createAtManager();
  let grantStatus: abilityAccessCtrl.GrantStatus;

  // 获取应用程序的accessTokenID
  let tokenId: number;
  try {
    let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
    tokenId = appInfo.accessTokenId;
  } catch (err) {
    console.error(`getBundleInfoForSelf failed, code is ${err.code}, message is ${err.message}`);
  }

  // 校验应用是否被授予权限
  try {
    grantStatus = await atManager.checkAccessToken(tokenId, permission);
  } catch (err) {
    console.error(`checkAccessToken failed, code is ${err.code}, message is ${err.message}`);
  }

  return grantStatus;
}

/**
 * 校验权限是否已经授权
 * @returns
 */
export async function checkPermissions(permission: Permissions): Promise<boolean> {
  let grantStatus: abilityAccessCtrl.GrantStatus = await checkAccessToken(permission);

  let currentStatue = false;
  if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
    // 已经授权，可以继续访问目标操作
    currentStatue = true
  } else {
    // 申请日历权限
    currentStatue = false
  }

  return new Promise<boolean>((resolve, reject) => {
    resolve(currentStatue)
  });
}

/**
 * 跳转系统app设置详情页面
 */
export function openPermissionsInSystemSettings(): void {
  let context = getContext(this) as common.UIAbilityContext;
  let wantInfo = {
    action: 'action.settings.app.info',
    parameters: {
      settingsParamBundleName: 'com.byc.hos_guide' // 打开指定应用的详情页面
    }
  }
  context.startAbility(wantInfo).then(() => {
    console.info(tagMsg('跳转app设置详情页成功'))
  }).catch((err) => {
    console.info(tagMsg(`跳转app设置详情页失败${err}}`))
  })
}