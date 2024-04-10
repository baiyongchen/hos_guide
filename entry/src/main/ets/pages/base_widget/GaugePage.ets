import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct GaugePage {
  @State message: string = 'Hello World'

  build() {
    Column() {

      T_14_3_b_h16_v10('1、基本')
      /**
       * 起始位置：顶部
       * 小黑色三角代表终点位置value的值
       */
      Gauge({ value: 70 })
        .width(200)
        .height(200)
        .colors([[UColors.theme_color, 1]])
        .strokeWidth(USizes.vp10)

      T_14_3_b_h16_v10('2、startAngle/endAngle')

      /**
       * startAngle：从顶部开始  0-360
       * startAngle=270 endAngle=90 半圆
       * 注意高度还要设置为全高度，不能因为是半圆设置一半高度
       */
      Gauge({ value: 70 })
        .width(200)
        .height(200)
        .colors([[UColors.theme_color, 1]])
        .strokeWidth(USizes.vp10)
        .startAngle(270)
        .endAngle(90)


      T_14_3_b_h16_v10('3、colors')

      /**
       * ColorStop(ResourceColor, number) number是比例
       */
      Gauge({ value: 70 })
        .width(200)
        .height(200)
        .colors([[UColors.theme_color, 0.5], [UColors.text_color9, 0.5], [UColors.text_color6, 0.5], [UColors.text_color3, 0.5]])
        .strokeWidth(USizes.vp10)
        .startAngle(270)
        .endAngle(90)

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}