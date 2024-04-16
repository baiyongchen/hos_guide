import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { tagMsg } from '../wan/utils/Logger';
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct StepperPage {
  @State defIndex: number = 0;
  private arr: Array<string> = [];

  aboutToAppear() {
    for (let index = 0; index < 10; index++) {
      this.arr.push(`${index}`);
    }
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('Stepper/StepperItem')
      Stepper({ index: this.defIndex }) {
        StepperItem() {
          Column() {
            Text('AAA')
          }
          .backgroundColor(Color.White)
          .width(USizes.match_parent)
          .height(USizes.match_parent)
        }
        .prevLabel('上一步')
        .nextLabel('下一步')
        .status(ItemState.Normal)

        StepperItem() {
          Column() {
            Text('BBB')
          }
          .backgroundColor(Color.White)
          .width(USizes.match_parent)
          .height(USizes.match_parent)
        }
        .prevLabel('上一步')
        .nextLabel('下一步')
        .status(ItemState.Normal)

        StepperItem() {
          Column() {
            Text('CCC')
          }
          .backgroundColor(Color.White)
          .width(USizes.match_parent)
          .height(USizes.match_parent)
        }
        .prevLabel('上一步')
        .nextLabel('下一步')
        .status(ItemState.Normal)

        StepperItem() {
          Column() {
            Text('DDD')
          }
          .backgroundColor(Color.White)
          .width(USizes.match_parent)
          .height(USizes.match_parent)
        }
        .prevLabel('上一步')
        .nextLabel('下一步')
        .status(ItemState.Normal)
      }
      .onFinish(() => {
        //步骤导航器最后一个StepperItem的nextLabel被点击时，并且ItemState属性为Normal时，触发该回调 。
        showToast('结束引导页，跳转主页');
      })
      .onSkip(() => {
        //当前显示的StepperItem状态为ItemState.Skip时，nextLabel被点击时触发该回调。
        showToast('结束引导页，跳过');
      })
      .onChange((prevIndex: number, index: number) => {
        //点击当前StepperItem的prevLabel进行步骤切换时触发该回调；或点击当前StepperItem的nextLabel，
        //当前页面不为步骤导航器最后一个StepperItem且ItemState属性为Normal时，触发该回调。
        //prevIndex：切换前的步骤页索引值。
        //index：切换后的步骤页（前一页或者下一页）索引值。
        console.debug(tagMsg('onChange'));
        showToast(`onChange:prevIndex=${prevIndex}<>index=${index}`);
      })
      .onNext((index: number, pendingIndex: number) => {
        //点击StepperItem的nextLabel切换下一步骤时，
        //当前页面不为步骤导航器最后一个StepperItem且ItemState属性为Normal时，触发该回调。
        //index：当前步骤页索引值。
        //pendingIndex：下一步骤页索引值。
        console.debug(tagMsg('onNext'));
        showToast(`onNext:index=${index}<>pendingIndex=${pendingIndex}`);

      })
      .onPrevious((index: number, pendingIndex: number) => {
        //点击StepperItem的prevLabel切换上一步骤时触发该回调。
        //index：当前步骤页索引值。
        //pendingIndex：上一步骤页索引值。
        console.debug(tagMsg('onPrevious'));
        showToast(`onPrevious:index=${index}<>pendingIndex=${pendingIndex}`);

      })
      .backgroundColor(UColors.text_color9)
      .width(USizes.match_parent)
      .layoutWeight(1)
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}