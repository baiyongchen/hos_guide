import { Net } from '@app/net/src/main/ets/utils/Net';
import { Title } from '../../../common/Title';
import { showToast } from '../../utils/ToastUtil';
import UColors from '../../utils/UColors'
import USizes from '../../utils/USizes'
import { UserApiPath } from './UserApiPath';
import { ReturnDataType } from '@app/net/src/main/ets/model/ReturnDataType';
import { tagMsg } from '../../utils/Logger';
import { RegisterUploadBean } from './bean/UserUploadBean';
import http from '@ohos.net.http';

@Entry
@Component
struct RegisterPage {
  @State account: string = '';
  @State pwd: string = '';
  @State pwdAgain: string = '';

  private async register() {
    if (this.pwd != this.pwdAgain) {
      showToast('两次输入密码不一致');
      return;
    }

    let upBean = new RegisterUploadBean(this.account, this.pwd, this.pwdAgain);

    console.error(tagMsg(this.account))
    console.error(tagMsg(this.pwd))
    let registerResult = await Net.post(UserApiPath.login)
      .setParams({ "username": this.account, "password": this.pwd })
      .setMethod(http.RequestMethod.POST)
      .returnData<string>(ReturnDataType.STRING);
    console.error(tagMsg(registerResult))
  }

  private checkAccountPwdEmpty(): boolean {
    return this.account != '' && this.pwd != '' && this.pwdAgain != '';
  }

  build() {
    Column() {
      Title({ title: '注册账号' })
      Column() {
        TextInput({ placeholder: $r('app.string.login_account_hint') })
          .width(USizes.match_parent)
          .height(USizes.vp50)
          .padding(0)
          .placeholderColor(UColors.text_color9)
          .backgroundColor(UColors.white)
          .placeholderFont({ size: USizes.fp16 })
          .caretColor(UColors.theme_color)
          .onChange((value) => {
            this.account = value;
          })
          .onEditChange((isEditing) => {

          })
        Divider()
          .width(USizes.match_parent)
          .height(USizes.vp1)
          .color(UColors.text_color9)
          .alignSelf(ItemAlign.Center)

        Divider()
          .height(USizes.vp10)
          .color(UColors.white)

        TextInput({ placeholder: $r('app.string.login_pwd_hint') })
          .width(USizes.match_parent)
          .height(USizes.vp50)
          .type(InputType.Password)
          .padding(0)
          .showPasswordIcon(true)
          .placeholderColor(UColors.text_color9)
          .backgroundColor(UColors.white)
          .placeholderFont({ size: USizes.fp16 })
          .caretColor(UColors.theme_color)
          .onChange((value) => {
            this.pwd = value;
          })
          .onEditChange((isEditing) => {
            //this.pwdEditing = isEditing;
          })

        Divider()
          .width(USizes.match_parent)
          .height(USizes.vp1)
          .color(UColors.text_color9)
          .alignSelf(ItemAlign.Center)

        Divider()
          .height(USizes.vp10)
          .color(UColors.white)

        TextInput({ placeholder: $r('app.string.login_pwd_again_hint') })
          .width(USizes.match_parent)
          .height(USizes.vp50)
          .type(InputType.Password)
          .padding(0)
          .showPasswordIcon(true)
          .placeholderColor(UColors.text_color9)
          .backgroundColor(UColors.white)
          .placeholderFont({ size: USizes.fp16 })
          .caretColor(UColors.theme_color)
          .onChange((value) => {
            this.pwdAgain = value;
          })
          .onEditChange((isEditing) => {
            //this.pwdEditing = isEditing;
          })

        Divider()
          .width(USizes.match_parent)
          .height(USizes.vp1)
          .color(UColors.text_color9)
          .alignSelf(ItemAlign.Center)
        Button('注册')
          .width(USizes.vp200)
          .height(USizes.vp40)
          .backgroundColor(UColors.theme_color)
          .enabled(this.checkAccountPwdEmpty())
          .margin({ top: USizes.vp40 })
          .onClick(() => {
            this.register();
          })
      }
      .width(USizes.match_parent)
      .layoutWeight(1)
      .padding(USizes.vp16)
    }
    .backgroundColor(UColors.white)
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}