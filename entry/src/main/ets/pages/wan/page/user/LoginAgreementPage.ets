import router from '@ohos.router'
import webview from '@ohos.web.webview'
import uri from '@ohos.uri'
import { Title } from '../../../common/Title'
import UColors from '../../utils/UColors'
import USizes from '../../utils/USizes'
import { Logger, tagMsg } from '../../utils/Logger'

@Entry
@Component
struct LoginAgreementPage {
  private title: string = router.getParams()['title'] ?? '协议';
  private url: string | Resource = $rawfile('web_empty.html')
  private webC: webview.WebviewController = new webview.WebviewController();

  aboutToAppear() {
    let tempUrl = router.getParams()['url'] as string;
    console.error(tagMsg(tempUrl));
    if (tempUrl == '') {
      this.url = $rawfile('web_empty.html');
    } else {
      if (tempUrl.startsWith('local')) {
        this.url = $rawfile(tempUrl.split('//')[1]);
      } else if (tempUrl.startsWith('http') || tempUrl.startsWith('https')) {
        this.url = tempUrl;
      } else {
        this.url = $rawfile('web_empty.html');
      }
    }
  }

  build() {
    Column() {
      Title({ title: this.title, backClick: () => {
        router.back();
      } })
      Web({ src: this.url, controller: this.webC })
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .backgroundColor(UColors.white)
  }
}