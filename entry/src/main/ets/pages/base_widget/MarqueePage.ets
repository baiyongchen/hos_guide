import { tagMsg } from '../wan/utils/Logger'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Styles
function match() {
  .width(USizes.match_parent)
  .height(USizes.match_parent)
}

@Entry
@Component
struct MarqueePage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Marquee({
          start: true,
          step: 20,
          loop: 5,
          fromStart: true,
          src: '该组件从API Version 8开始支持。后续版本如有新增内容，则采用上角标单独标记该内容的起始版本。'
        })
          .fontColor(UColors.white)
          .fontSize(USizes.fp16)
          .onStart(() => {
            console.debug(tagMsg('开始'))
          })
          .onBounce(() => {
            console.debug(tagMsg('完成一次'))
          })
          .onFinish(() => {
            console.debug(tagMsg('滚动全部次数结束'))
          })
      }
      .width(USizes.match_parent)
      .height(USizes.vp100)
      .backgroundColor(Color.Black)
      .borderRadius(USizes.vp10)
    }
    .padding({ left: USizes.vp16, right: USizes.vp16 })
    .justifyContent(FlexAlign.Center)
    .match()
  }
}