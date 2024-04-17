import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World'

  /**
   * Flex组件在渲染时存在二次布局过程，因此在对性能有严格要求的场景下建议使用Column、Row代替。
   * Flex组件主轴默认不设置时撑满父容器，Column、Row组件主轴不设置时默认是跟随子节点大小。
   */
  build() {
    List() {
      ListItem() {
        Column() {
          T_14_3_b_h16_v10('17.ItemAlign.Auto')
          Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Auto }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(40)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(50)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('16.ItemAlign.End')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.End }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('15.ItemAlign.Center')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('14.ItemAlign.Start')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('13.FlexAlign.SpaceEvenly')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceEvenly }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('12.FlexAlign.SpaceAround')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('11.FlexAlign.SpaceBetween')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('10.FlexAlign.End')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.End }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('9.FlexAlign.Center')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('8.FlexAlign.Start')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('7.FlexWrap.WrapReverse')
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.WrapReverse }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('6.FlexWrap.Wrap')
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('5.FlexWrap.NoWrap')
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap }) {
            Text('aaa').width('70%')
              .height(30)
              .backgroundColor(Color.Brown)
            Text('bbb').width('80%')
              .height(30)
              .backgroundColor(Color.Gray)
            Text('ccc').width('40%')
              .height(30)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(120)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('4.FlexDirection.ColumnReverse')
          Flex({ direction: FlexDirection.ColumnReverse }) {
            Text('aaa').width('10%')
              .height(50)
              .backgroundColor(Color.Brown)
            Text('bbb').width('20%')
              .height(50)
              .backgroundColor(Color.Gray)
            Text('ccc').width('30%')
              .height(50)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(100)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('3.FlexDirection.Column')
          Flex({ direction: FlexDirection.Column }) {
            Text('aaa').width('10%')
              .height(50)
              .backgroundColor(Color.Brown)
            Text('bbb').width('20%')
              .height(50)
              .backgroundColor(Color.Gray)
            Text('ccc').width('30%')
              .height(50)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(100)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('2.FlexDirection.RowReverse')
          Flex({ direction: FlexDirection.RowReverse }) {
            Text('aaa').width('10%')
              .height(50)
              .backgroundColor(Color.Brown)
            Text('bbb').width('20%')
              .height(50)
              .backgroundColor(Color.Gray)
            Text('ccc').width('30%')
              .height(50)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(100)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }

      ListItem() {
        Column() {
          T_14_3_b_h16_v10('1.FlexDirection.Row')
          Flex({ direction: FlexDirection.Row }) {
            Text('aaa').width('10%')
              .height(50)
              .backgroundColor(Color.Brown)
            Text('bbb').width('20%')
              .height(50)
              .backgroundColor(Color.Gray)
            Text('ccc').width('30%')
              .height(50)
              .backgroundColor(Color.Green)
          }
          .width(USizes.match_parent)
          .height(100)
          .backgroundColor(UColors.cfef5f5)
          .borderRadius(10)
          .borderWidth(1)
          .borderColor(UColors.theme_color)
        }
      }
    }
    .padding(16)
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}