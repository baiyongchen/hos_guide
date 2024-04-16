import { tagMsg } from '../wan/utils/Logger';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TimePickerPage {
  @State message: string = 'Hello World'
  @State us: boolean = false;

  build() {
    Column() {
      TimePicker({ selected: new Date() })
        .useMilitaryTime(this.us)
        .onChange((v) => {
          console.debug(tagMsg(JSON.stringify(v)))
        })
      Button('切换')
        .onClick(() => {
          this.us = !this.us;
        })
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}