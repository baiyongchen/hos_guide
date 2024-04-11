import { MLoadingProgress } from '../common/MLoadingProgress';
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct LoadingProgressPage {
  @State pageStatus: boolean = true;

  onPageShow() {
    setInterval(() => {
      this.pageStatus = false;
    }, 5000)
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.pageStatus) {
        MLoadingProgress()
      } else {
        LoadingProgress()
          .width(USizes.vp50)
          .height(USizes.vp50)
          .color(UColors.theme_color)
      }
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}