import { tagMsg } from '../wan/utils/Logger';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextClockPage {
  @State message: string = 'Hello World'
  private mC: TextClockController = new TextClockController();

  build() {
    Column() {
      TextClock({ timeZoneOffset: -8, controller: this.mC })
        .format('yyyy-MM-dd HH-mm-ss')
        .onDateChange((v) => {
          console.debug(tagMsg(`${v}`))
        })

      Button('开始')
        .onClick(() => {
          this.mC.start();
        })
      Button('停止')
        .onClick(() => {
          this.mC.stop();
        })
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}