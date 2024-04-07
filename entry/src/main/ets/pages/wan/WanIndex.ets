import router from '@ohos.router';
import { RouterUtils } from './utils/RouterUtils';
import UColors from './utils/UColors'
import USizes from './utils/USizes'

@Entry
@Component
struct WanIndex {
  @State downCount: number = 3000;
  private timerId: number;

  aboutToAppear() {

  }

  onPageShow() {
    this.timerId = setInterval(
      () => {
        if (this.downCount == 0) {
          clearInterval(this.timerId)
          router.pushUrl({ url: RouterUtils.login })
        } else {
          this.downCount = this.downCount - 1000;
        }
      }, 1000
    );
  }

  aboutToDisappear() {
    clearInterval(this.timerId)
  }

  build() {
    RelativeContainer() {

      Text(`${this.downCount / 1000}S`)
        .width(USizes.vp60)
        .fontColor(UColors.theme_color)
        .fontSize(USizes.fp14)
        .padding({ top: USizes.vp8, bottom: USizes.vp8 })
        .margin({ top: USizes.vp20, right: USizes.vp16 })
        .textAlign(TextAlign.Center)
        .backgroundColor(UColors.cf4f5f6)
        .border({ radius: USizes.vp5, width: USizes.vp1, color: UColors.theme_color })
        .id("wan_index_count")
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })

      Text('W')
        .width(USizes.vp200)
        .height(USizes.vp200)
        .fontColor(UColors.white)
        .textAlign(TextAlign.Center)
        .fontSize(USizes.fp60)
        .backgroundColor(UColors.theme_color)
        .borderRadius(USizes.vp100)
        .alignSelf(ItemAlign.Center)
        .id("wan_index_header")
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })

    }
    .width(USizes.match_parent)
    .backgroundColor(UColors.common_bg)
    .height(USizes.match_parent)
  }
}

