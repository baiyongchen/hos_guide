import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { Title } from '../../common/Title'

@Entry
@Component
struct WebPage11 {
  private mWewController: webview.WebviewController = new webview.WebviewController();
  private
  private readonly urlGuide = 'https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-relativecontainer-0000001478341165-V2';
  private readonly urlApi = 'https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/syscap-0000001408089368-V2?catalogVersion=V2'

  build() {
    Column() {
      Title({ title: '加载网络页面', backClick: () => {
        router.back()
      }, },)

      Row({ space: '20vp' }) {
        Button('加载指南')
          .onClick(() => {
            try {
              this.mWewController.loadUrl(this.urlGuide);
            } catch (error) {
              console.log(error)
            }
          })
        Button('加载API参考')
          .onClick(() => {
            try {
              this.mWewController.loadUrl(this.urlApi);
            } catch (error) {
              console.log(error)
            }
          })
      }
      .padding({ top: '10vp', bottom: '10vp' })

      Web({
        src: 'www.baidu.com', controller: this.mWewController
      })
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}