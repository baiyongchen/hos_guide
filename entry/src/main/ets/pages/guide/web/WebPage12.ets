import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { Title } from '../../common/Title'

@Entry
@Component
struct WebPage11 {
  private mSc: Scroller = new Scroller();
  private mWewController: webview.WebviewController = new webview.WebviewController();
  private readonly urlPerson = $rawfile('person_protocol.html');
  private readonly urlUser = $rawfile('user_protocol.html');

  build() {
    Column() {
      Title({ title: '加载本地页面', backClick: () => {
        router.back()
      }, },)

      Row({ space: '20vp' }) {
        Button('加载隐私协议')
          .onClick(() => {
            try {
              this.mWewController.loadUrl(this.urlPerson);
            } catch (error) {
              console.log(error)
            }
          })
        Button('加载用户协议')
          .onClick(() => {
            try {
              this.mWewController.loadUrl(this.urlUser);
            } catch (error) {
              console.log(error)
            }
          })
      }
      .padding({ top: '10vp', bottom: '10vp' })

      /*Scroll(this.mSc) {

      }
      .layoutWeight(1)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)*/
      Web({
        src: this.urlPerson, controller: this.mWewController
      })
        .layoutWeight(1)
        .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}