import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct ProgressPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基础')
      Progress({ value: 20, total: 100 })

      T_14_3_b_h16_v10('2、基础Linear')
      Progress({ value: 20, total: 100, type: ProgressType.Linear })
        .value(40)
        .color(UColors.theme_color)
        .backgroundColor(UColors.text_color9)
        .style({ strokeWidth: 20 })

      T_14_3_b_h16_v10('3、基础Ring')
      Progress({ value: 20, total: 100, type: ProgressType.Ring })
        .value(40)
        .color(UColors.theme_color)
        .backgroundColor(UColors.text_color9)
        .style({ strokeWidth: 10 })

      T_14_3_b_h16_v10('4、基础Eclipse')
      Progress({ value: 20, total: 100, type: ProgressType.Eclipse })
        .value(40)
        .color(UColors.theme_color)
        .backgroundColor(UColors.text_color9)
      T_14_3_b_h16_v10('5、基础ScaleRing')
      Progress({ value: 20, total: 100, type: ProgressType.ScaleRing })
        .value(40)
        .color(UColors.theme_color)
        .backgroundColor(UColors.text_color9)
        .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })

      T_14_3_b_h16_v10('6、基础Capsule')
      Progress({ value: 20, total: 100, type: ProgressType.Capsule })
        .value(40)
        .color(UColors.theme_color)
        .backgroundColor(UColors.text_color9)
        .width(200)
        .height(50)


      T_14_3_b_h16_v10('注意: .style({ strokeWidth: 20 })设置进度条宽度')

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}