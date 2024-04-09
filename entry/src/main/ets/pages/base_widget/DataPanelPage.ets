import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct DataPanelPage {
  private baseArr: number[] = [12, 30, 6, 20];
  private halfBaseArr: number[] = [];

  aboutToAppear() {
    this.halfBaseArr = this.baseArr.map((v) => {
      return v / 2;
    })
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基本(圆/直线)')

      DataPanel({ values: this.baseArr, max: 100, type: DataPanelType.Circle })
        .width(USizes.vp200)
        .height(USizes.vp200)
        .backgroundColor('#f4f5f6')
        .closeEffect(true)

      DataPanel({ values: this.baseArr, max: 100, type: DataPanelType.Line })
        .width(USizes.vp200)
        .height(USizes.vp10)
        .margin({ top: USizes.vp20 })
        .backgroundColor('#f4f5f6')

      Divider()
        .height(USizes.vp20)
        .color(Color.White)

      T_14_3_b_h16_v10('2、转换(半圆)')

      Stack({ alignContent: Alignment.Top }) {
        DataPanel({ values: this.halfBaseArr, max: 100, type: DataPanelType.Circle })
          .width(USizes.vp200)
          .height(USizes.vp200)
          .rotate({
            x: 0,
            y: 0,
            z: 1,
            centerX: '50%',
            centerY: '50%',
            angle: -90
          })
        Text('测试80%')
          .fontSize(USizes.fp12)
          .fontColor(UColors.theme_color)
          .margin({ top: USizes.vp80 })
      }

    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .alignItems(HorizontalAlign.Start)

  }
}