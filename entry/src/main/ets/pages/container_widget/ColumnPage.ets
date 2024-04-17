import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct ColumnPage {
  @State message: string = 'Hello World'
  private mS: Scroller = new Scroller();

  build() {
    List() {
      ListItem() {
        Column() {
          T_14_3_b_h16_v10('1.space')
          Column({ space: 20 }) {
            Text('aaa')
              .backgroundColor(Color.Black)
              .fontColor(UColors.white)
              .textAlign(TextAlign.Center)
            Text('bbb')
              .backgroundColor(Color.Black)
              .fontColor(UColors.white)
              .textAlign(TextAlign.Center)
          }
          .padding(5)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('2.alignItems>>>HorizontalAlign.Start')
          Column({ space: 10 }) {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
          }
          .alignItems(HorizontalAlign.Start)
          .justifyContent(FlexAlign.Center)
          .padding(5)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('3.alignItems>>>HorizontalAlign.Center')
          Column({ space: 10 }) {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .padding(5)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('4.alignItems>>>HorizontalAlign.End')
          Column({ space: 10 }) {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
          }
          .alignItems(HorizontalAlign.End)
          .justifyContent(FlexAlign.Center)
          .padding(5)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('5.justifyContent>>>FlexAlign.Start')
          Column() {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('6.justifyContent>>>FlexAlign.Center')
          Column() {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('7.justifyContent>>>FlexAlign.End')
          Column() {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.End)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('8.justifyContent>>>FlexAlign.SpaceBetween')
          Column() {
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 20 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.SpaceBetween)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('9.justifyContent>>>FlexAlign.SpaceAround')
          Column() {
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.SpaceAround)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('10.justifyContent>>>FlexAlign.SpaceEvenly')
          Column() {
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Orange)
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Brown)
            Row().size({ width: 120, height: 10 }).backgroundColor(Color.Blue)
          }
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.SpaceEvenly)
          .height(USizes.vp80)
          .width(USizes.match_parent)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }
    }
    .padding(20)
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}