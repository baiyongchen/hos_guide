import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct DividerPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基本')
      Divider()

      Divider()
        .color(UColors.white)
        .height(USizes.vp20)

      Row() {
        Divider()
          .vertical(true)
      }
      .width(USizes.match_parent)
      .height(USizes.vp20)
      .justifyContent(FlexAlign.Center)

      Divider()
        .color(UColors.white)
        .height(USizes.vp20)


      Divider()
        .color(UColors.theme_color)

      T_14_3_b_h16_v10('2、strokeWidth(优先级低于通用属性height，超过通用属性设置大小时，按照通用属性进行裁切。)')

      Divider()
        .color(UColors.theme_color)
        .strokeWidth(USizes.vp10)

      Divider()
        .color(UColors.white)
        .height(USizes.vp20)

      /*
      *strokeWidth和height同是设置
      *渲染上：strokeWidth优先级高
      *实际上:height优先级高
       */
      Divider()
        .height('20vp')
        .color(UColors.theme_color)
        .strokeWidth('200vp')


      Divider()
        .color(UColors.white)
        .height(USizes.vp200)

      T_14_3_b_h16_v10('3、LineCapStyle.Butt)')
      Divider()
        .color(UColors.theme_color)
        .strokeWidth('20vp')
        .margin({ left: USizes.vp16, right: USizes.vp16 })
        .lineCap(LineCapStyle.Butt)
      T_14_3_b_h16_v10('4、LineCapStyle.Round)')
      Divider()
        .color(UColors.theme_color)
        .strokeWidth('20vp')
        .margin({ left: '26vp', right: '26vp' })
        .lineCap(LineCapStyle.Round)
      T_14_3_b_h16_v10('5、LineCapStyle.Square)')
      Divider()
        .color(UColors.theme_color)
        .strokeWidth('20vp')
        .margin({ left: USizes.vp16, right: USizes.vp16 })
        .lineCap(LineCapStyle.Square)

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
    .alignItems(HorizontalAlign.Start)
  }
}