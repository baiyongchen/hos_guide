import router from '@ohos.router'
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct WebPage3 {
  controller: web_webview.WebviewController = new web_webview.WebviewController()

  build() {
    Column() {
      // 加载本地local.html页面
      Web({ src: $rawfile('web_input_file.html'), controller: this.controller })
        .onShowFileSelector((event) => {
          // 开发者设置要上传的文件路径
          let fileList: Array<string> = [
            'xxx/test.png',
          ]
          if (event) {
            event.result.handleFileList(fileList)
          }
          return true;
        })
    }
  }
}