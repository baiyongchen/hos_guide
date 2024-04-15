import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct SliderPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      Slider({ value: 10, min: 0, max: 100 })
      T_14_3_b_h16_v10('2.step')
      Slider({ value: 10, min: 0, max: 100, step: 10 })
      T_14_3_b_h16_v10('3.style')
      Slider({
        value: 10,
        min: 0,
        max: 100,
        step: 10,
        style: SliderStyle.OutSet
      })
      Slider({
        value: 10,
        min: 0,
        max: 100,
        step: 10,
        style: SliderStyle.InSet
      })
      T_14_3_b_h16_v10('4.direction/reverse')

      Row() {
        Slider({
          value: 10,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.OutSet,
          direction: Axis.Vertical
        })
        Slider({
          value: 10,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.InSet,
          direction: Axis.Horizontal,
          reverse: true
        })
          .layoutWeight(1)
      }
      .width(USizes.match_parent)
      .height(USizes.vp200)
      .padding(USizes.vp16)

      T_14_3_b_h16_v10('5.额外属性')
      Slider({
        value: 10,
        min: 0,
        max: 100,
        step: 10,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal
      })
        .borderColor('#000000')
        .trackColor(UColors.cfef5f5)
        .selectedColor(UColors.theme_color)
        .showSteps(true)
        .showTips(true)
        .trackThickness(USizes.vp10)
        .onChange((v: number, m: SliderChangeMode) => {
          showToast(`${v}->${m.valueOf()}`)
        })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}