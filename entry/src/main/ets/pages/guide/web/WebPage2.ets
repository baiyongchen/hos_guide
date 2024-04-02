import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { Title } from '../../common/Title'

@Entry
@Component
struct WebPage2 {
  private mWebController: webview.WebviewController = new webview.WebviewController();
  @State dMode: WebDarkMode = WebDarkMode.Auto;
  @State mAccess: boolean = false;

  build() {
    Column() {
      Title({ title: '设置深色模式', backClick: () => {
        router.back();
      } })

      Row({ space: '10vp' }) {
        Button('Auto').onClick(() => {
          this.dMode = WebDarkMode.Auto;
        })
        Button('On').onClick(() => {
          this.dMode = WebDarkMode.On;
        })
        Button('Off').onClick(() => {
          this.dMode = WebDarkMode.Off;
        })
      }
      .padding({ top: '10vp', bottom: '10vp' })

      Row({ space: '10vp' }) {
        Button('Access true').onClick(() => {
          this.mAccess = true;
        })
        Button('Access false').onClick(() => {
          this.mAccess = false;
        })
      }
      .padding({ top: '10vp', bottom: '10vp' })

      Web({ src: 'https://www.baidu.com/?/', controller: this.mWebController })
        .darkMode(this.dMode)
        .forceDarkAccess(this.mAccess)

    }
    .width('100%')
    .width('100%')
  }
}