import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { Title } from '../../common/Title'

@Entry
@Component
struct WebPage13 {
  private mWebC: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Title({ title: '加载HTML格式的文本数据', backClick: () => {
        router.back()
      }, },)
      Button('加载html文本')
        .margin({ top: '10vp', bottom: '10vp' })
        .onClick(() => {
          this.mWebC.loadData('<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>', "text/html",
            "UTF-8")
        })
      Web({ src: $rawfile('user_protocol.html'), controller: this.mWebC })
    }
    .width('100%')
    .height('100%')
  }
}