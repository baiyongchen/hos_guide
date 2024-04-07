import { Net } from '@app/net/src/main/ets/utils/Net';
import router from '@ohos.router';
import { RouterUtils } from '../../utils/RouterUtils';
import UColors from '../../utils/UColors'
import USizes from '../../utils/USizes'
import { AccountComponent } from './component/AccountComponent'
import { ReturnDataType } from '@app/net/src/main/ets/model/ReturnDataType';
import { tagMsg } from '../../utils/Logger';
import http from '@ohos.net.http';

@Entry
@Component
struct LoginPage {
  @State account: string = '';
  //@State accountEditing: boolean = false;
  @State pwd: string = '';

  //@State pwdEditing: boolean = false;

  private async banner() {
    let banner = await Net.post('/user/login')
    //.setMethod(http.RequestMethod.POST)
    .setParams('username=15237131545&password=bai6788170')
    .returnData<string>(ReturnDataType.STRING)
    console.error(tagMsg(banner))

  }

  build() {
    Column() {
      Text('W')
        .width(USizes.vp100)
        .height(USizes.vp100)
        .fontColor(UColors.white)
        .fontSize(USizes.fp40)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.Red)
        .textAlign(TextAlign.Center)
        .border({ radius: USizes.vp50 })
        .margin({ top: USizes.vp50, bottom: USizes.vp50 })

      Column() {
        TextInput({ placeholder: $r('app.string.login_account_hint') })
          .width(USizes.match_parent)
          .height(USizes.vp50)
          .padding({ left: USizes.vp16, right: USizes.vp16 })
          .placeholderColor(UColors.text_color9)
          .backgroundColor(UColors.white)
          .placeholderFont({ size: USizes.fp16 })
          .caretColor(UColors.theme_color)
          .onChange((value) => {
            this.account = value;
          })
          .onEditChange((isEditing) => {
            //this.accountEditing = isEditing;
          })

        Divider()
          .width(USizes.match_parent)
          .height(USizes.vp1)
          .color(UColors.text_color9)
          .alignSelf(ItemAlign.Center)
      }
      .padding({ left: USizes.vp16, right: USizes.vp16 })

      Divider()
        .height(USizes.vp20)
        .color(UColors.white)

      Column() {
        TextInput({ placeholder: $r('app.string.login_pwd_hint') })
          .width(USizes.match_parent)
          .height(USizes.vp50)
          .padding({ left: USizes.vp16, right: USizes.vp16 })
          .type(InputType.Password)
          .showPasswordIcon(false)
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
      }
      .padding({ left: USizes.vp16, right: USizes.vp16 })

      Button('登录')
        .fontColor(UColors.white)
        .fontSize(USizes.fp14)
        .backgroundColor(this.checkLoginStatue(this.account, this.pwd) ? UColors.theme_color : UColors.text_color9)
        .enabled(this.checkLoginStatue(this.account, this.pwd))
        .height(USizes.vp40)
        .width(USizes.vp200)
        .alignSelf(ItemAlign.Center)
        .margin({ top: USizes.vp20 })
        .onClick(() => {
          this.banner();
        })
      Button('注册')
        .fontColor(UColors.theme_color)
        .fontSize(USizes.fp14)
        .backgroundColor(UColors.cf4f5f6)
        .height(USizes.vp40)
        .width(USizes.vp200)
        .alignSelf(ItemAlign.Center)
        .margin({ top: USizes.vp20 })
        .onClick(() => {
          router.pushUrl({
            url: RouterUtils.register
          })
        })

      Blank()

      Row() {
        Text('用户协议')
          .onClick(() => {
            router.pushUrl({
              url: RouterUtils.login_agreement,
              params: { 'title': '用户协议', 'url': 'local://user_protocol.html' }
            })
          })
        Text('隐私协议')
          .onClick(() => {
            router.pushUrl({
              url: RouterUtils.login_agreement,
              params: { 'title': '隐私协议', 'url': 'local://person_protocol.html' }
            })
          })
      }
      .width(USizes.match_parent)
      .padding(USizes.vp16)
      .justifyContent(FlexAlign.SpaceEvenly)

      //AccountComponent()
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .backgroundColor(UColors.white)
  }

  private checkLoginStatue(account: string, pwd: string): boolean {
    return account != '' && pwd != '';
  }
}