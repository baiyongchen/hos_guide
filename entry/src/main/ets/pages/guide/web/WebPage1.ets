import router from '@ohos.router'
import UColors from '../../wan/utils/UColors'
import USizes from '../../wan/utils/USizes'

@Entry
@Component
struct WebPage1 {
  build() {
    Column({ space: USizes.vp10 }) {
      Text('使用Web组件加载页面')
        .width(USizes.match_parent)
        .height(USizes.vp50)
        .fontColor(UColors.text_color3)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Button('加载网络页面')
        .onClick(() => {
          router.pushUrl({ url: 'pages/guide/web/WebPage11' })
        })
      Button('加载本地页面')
        .onClick(() => {
          router.pushUrl({ url: 'pages/guide/web/WebPage12' })
        })
      Button('加载HTML格式的文本数据')
        .onClick(() => {
          router.pushUrl({ url: 'pages/guide/web/WebPage13' })
        })
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .backgroundColor(UColors.common_bg)
  }
}