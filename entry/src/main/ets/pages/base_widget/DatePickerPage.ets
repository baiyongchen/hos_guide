import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { tagMsg } from '../wan/utils/Logger'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct DatePickerPage {
  @State currentDate1: string = '2024-4-9';
  @State currentDate2: string = '2024-4-9';

  build() {
    Column() {
      T_14_3_b_h16_v10('1、公历')
      DatePicker({ start: new Date('2020-01-01'), end: new Date('2030-12-31'), selected: new Date(this.currentDate2) })
        .lunar(false)
        .onChange((v) => {
          this.currentDate1 = `${v.year}-${v.month + 1}-${v.day}`;
          console.debug(tagMsg(`111111年：${v.year} 月：${v.month + 1} 日：${v.day}`))
        })
        .width(USizes.vp200)

      Divider()
        .height(USizes.vp20)
        .color(UColors.white)

      T_14_3_b_h16_v10('2、农历')
      DatePicker({ start: new Date('2020-01-01'), end: new Date('2030-12-31'), selected: new Date(this.currentDate1) })
        .lunar(true)
        .onChange((v) => {
          this.currentDate2 = `${v.year}-${v.month + 1}-${v.day}`;
          console.debug(tagMsg(`222222年：${v.year} 月：${v.month} 日：${v.day}`))
        })
        .width(USizes.vp200)
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)

  }
}