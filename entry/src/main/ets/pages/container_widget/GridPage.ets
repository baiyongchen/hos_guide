import { T_14_3_b_h16_v10 } from '../common/TextBuilder';
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World'
  private gridArr: number[] = [];
  private gridScroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let index = 0; index < 200; index++) {
      this.gridArr.push(index);
    }
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1.rowsTemplate、columnsTemplate同时设置:')
      Grid(this.gridScroller) {
        ForEach(this.gridArr, (item: number, index: number) => {
          GridItem() {
            Text(item.toString())
              .width(USizes.match_parent)
              .height(USizes.match_parent)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Orange)
          }
        }, (item: number, index: number) => {
          return JSON.stringify(item);
        })
      }
      .columnsTemplate('1fr 1fr 2fr 3fr')
      .rowsTemplate('2fr 1fr 3fr')
      .columnsGap(10)
      .rowsGap(10)
      .width(200)
      .height(100)

      T_14_3_b_h16_v10('2.rowsTemplate、columnsTemplate仅设置其中的一个：')
      Grid(this.gridScroller) {
        ForEach(this.gridArr, (item: number, index: number) => {
          GridItem() {
            if ((index % 2) == 0) {
              Text(item.toString())
                .width(USizes.match_parent)
                .height(70)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Gray)
            } else {
              Text(item.toString())
                .width(USizes.match_parent)
                .height(50)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
            }
          }
        }, (item: number, index: number) => {
          return JSON.stringify(item);
        })
      }
      .columnsTemplate('1fr 1fr 2fr 3fr')
      .columnsGap(10)
      .rowsGap(10)
      .width(200)
      .height(100)

      T_14_3_b_h16_v10('3.rowsTemplate、columnsTemplate都不设置：')
      Grid(this.gridScroller) {
        ForEach(this.gridArr, (item: number, index: number) => {
          GridItem() {
            Text(item.toString())
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Orange)
              .width(50)
          }
        }, (item: number, index: number) => {
          return JSON.stringify(item);
        })
      }
      .width(200)
      .height(100)
      .minCount(3)
      .maxCount(5)
      .columnsGap(5)
      .cellLength(20)
      .rowsGap(5)

      T_14_3_b_h16_v10('4.事件')
      Grid(this.gridScroller) {
        ForEach(this.gridArr, (item: number, index: number) => {
          GridItem() {
            Text(item.toString())
              .width(USizes.match_parent)
              .height(50)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Orange)
          }
        }, (item: number, index: number) => {
          return JSON.stringify(item);
        })
      }
      .columnsTemplate('1fr 1fr 2fr 3fr')
      .columnsGap(10)
      .rowsGap(10)
      .editMode(true)
      .supportAnimation(true)
      .onScrollIndex((first) => {
        showToast(first.toString());
      })
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}