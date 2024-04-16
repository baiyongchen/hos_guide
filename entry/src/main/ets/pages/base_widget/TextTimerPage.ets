import { tagMsg } from '../wan/utils/Logger';
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextTimerPage {
  @State message: string = 'Hello World'
  private ttc: TextTimerController = new TextTimerController();
  @State d: string = '50s';

  build() {
    Column() {
      Text(this.d)
        .textAlign(TextAlign.Center)
        .fontSize(USizes.fp14)
        .fontColor(UColors.text_color3)
        .width(USizes.vp60)
        .borderWidth(1)
        .borderColor(UColors.theme_color)
        .borderRadius(5)
        .padding({ top: 8, bottom: 8 })
        .backgroundColor(UColors.cfef5f5)
        .alignSelf(ItemAlign.End)
        .margin({ right: 16, top: 20 })

      Stack() {
        TextTimer({ isCountDown: true, count: 50000, controller: this.ttc })
          .format('ss')
          .onTimer((utc: number, elapsedTime: number) => {
            console.debug(tagMsg(`${elapsedTime}`))
            this.d = `${((50000 - elapsedTime) / 1000).toFixed(0)}s`;
          })
      }
      .width(USizes.vp60)
      .height(USizes.vp40)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
      .borderRadius(5)
      .backgroundColor(UColors.cfef5f5)
      .alignSelf(ItemAlign.End)
      .margin({ right: 16, top: 20 })

      Button('开始')
        .onClick(() => {
          this.ttc.start();
        })
      Button('暂停')
        .onClick(() => {
          this.ttc.pause();
        })
      Button('重置')
        .onClick(() => {
          this.ttc.reset();
        })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}