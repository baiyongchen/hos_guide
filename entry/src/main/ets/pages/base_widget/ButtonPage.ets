import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct ButtonPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text('Button一个参数，可包含自组件')
        .fontColor(UColors.text_color3)
        .fontSize(USizes.fp14)
        .fontWeight(FontWeight.Bold)

      Row({ space: USizes.vp20 }) {
        Button({ type: ButtonType.Capsule, stateEffect: true }) {
          Text('Capsule')
            .fontColor(UColors.white)
            .fontSize(USizes.vp14)
        }
        .padding({ left: USizes.vp10, top: USizes.vp6, right: USizes.vp10, bottom: USizes.vp6 })

        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Text('Circle')
            .fontColor(UColors.white)
            .fontSize(USizes.vp14)
            .padding(USizes.vp16)
        }

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Text('Normal')
            .fontColor(UColors.white)
            .fontSize(USizes.vp14)
        }
        .padding({ left: USizes.vp10, top: USizes.vp6, right: USizes.vp10, bottom: USizes.vp6 })
      }
      .width(USizes.match_parent)
      .justifyContent(FlexAlign.SpaceAround)
      .padding({ top: USizes.vp16, bottom: USizes.vp16 })

      Text('Button二个参数，可包含自组件')
        .fontColor(UColors.text_color3)
        .fontSize(USizes.fp14)
        .fontWeight(FontWeight.Bold)

      Row({ space: USizes.vp20 }) {
        Button('Capsule', { type: ButtonType.Capsule, stateEffect: true })
          .fontSize(USizes.vp14)
          .padding({ left: 0, top: 0, right: 0, bottom: 0 })

        Button('Circle', { type: ButtonType.Circle, stateEffect: true })
          .fontSize(USizes.fp20)
          .width(USizes.vp100)
          .height(USizes.vp100)

        Button('Normal', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(USizes.vp14)
          .padding({ left: USizes.vp10, top: USizes.vp6, right: USizes.vp10, bottom: USizes.vp6 })
      }
      .width(USizes.match_parent)
      .justifyContent(FlexAlign.SpaceAround)
      .padding({ top: USizes.vp16, bottom: USizes.vp16 })

      Text('Button使用一个参数，然后包含一个子组件，可定制性高；使用两个参数，需要注意系统默认的button值')
        .fontColor(UColors.theme_color)
        .fontSize(USizes.fp14)
        .fontWeight(FontWeight.Bold)
    }
    .alignItems(HorizontalAlign.Start)
    .height(USizes.match_parent)
    .padding(USizes.vp16)
    .backgroundColor(UColors.common_bg)
    .width(USizes.match_parent)
  }
}