import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct PatternLockPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基础')
      PatternLock()
        .sideLength(USizes.vp200)
        .circleRadius(USizes.vp10)
        .regularColor(UColors.text_color9)
        .selectedColor(UColors.theme_color)
        .activeColor(UColors.theme_color)
        .pathColor(UColors.theme_color)
        .pathStrokeWidth(USizes.vp20)
        .autoReset(true)
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}