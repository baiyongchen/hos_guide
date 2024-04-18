import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct WaterFlowFlowItemPage {
  @State message: string = 'Hello World'
  private wfS: Scroller = new Scroller();
  private numArr: number[] = [];

  aboutToAppear() {
    for (let index = 0; index < 200; index++) {
      this.numArr.push(index);
    }
  }

  @Builder
  WaterFlowFooter() {
    Text('我是底部') {

    }
    .textAlign(TextAlign.Center)
    .width(USizes.match_parent)
    .height(USizes.vp50)
    .backgroundColor(UColors.cfef5f5)
  }

  @Builder
  FlowItemText1(text: string) {
    Text(text)
      .height(USizes.match_parent)
      .width(30)
      .backgroundColor(Color.Blue)
      .textAlign(TextAlign.Center)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
  }

  @Builder
  FlowItemText2(text: string) {
    Text(text)
      .height(USizes.match_parent)
      .width(100)
      .backgroundColor(Color.Green)
      .textAlign(TextAlign.Center)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
  }

  @Builder
  FlowItemText3(text: string) {
    Text(text)
      .height(USizes.match_parent)
      .width(60)
      .backgroundColor(Color.Orange)
      .textAlign(TextAlign.Center)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
  }

  @Builder
  FlowItemText4(text: string) {
    Text(text)
      .height(USizes.match_parent)
      .width(50)
      .backgroundColor(Color.Gray)
      .textAlign(TextAlign.Center)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
  }

  @Builder
  FlowItemText5(text: string) {
    Text(text)
      .height(USizes.match_parent)
      .width(120)
      .backgroundColor(Color.Pink)
      .textAlign(TextAlign.Center)
      .borderWidth(1)
      .borderColor(UColors.theme_color)
  }

  build() {
    Column() {
      WaterFlow({ footer: this.WaterFlowFooter(), scroller: this.wfS }) {
        ForEach(this.numArr, (item: number, index: number) => {
          FlowItem() {
            if ((index % 5) == 0) {
              this.FlowItemText1(item.toString());
            } else if ((index % 5) == 1) {
              this.FlowItemText2(item.toString());
            }
            else if ((index % 5) == 2) {
              this.FlowItemText3(item.toString());
            }
            else if ((index % 5) == 3) {
              this.FlowItemText4(item.toString());
            } else {
              this.FlowItemText5(item.toString());
            }
          }
        }, (item: number, index: number) => {
          return JSON.stringify(item);
        })
      }
      .width(USizes.match_parent)
      .height('80%')
      .layoutDirection(FlexDirection.Row)
      .rowsTemplate('1fr 3fr 2fr')
      .rowsGap(10)
      .columnsGap(5)
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .onReachStart(() => {
        showToast('onReachStart');
      })
      .onReachEnd(() => {
        showToast('onReachEnd');
      })
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}