import { ImageAnimatorLoading } from '../common/ImageAnimatorLoading';
import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct ImageAnimatorPage {
  private images: Array<ImageFrameInfo> = [];
  @State pageStatus: boolean = true;

  aboutToAppear() {
    this.images.push({ src: $r('app.media.loading001') })
    this.images.push({ src: $r('app.media.loading002') })
    this.images.push({ src: $r('app.media.loading003') })
    this.images.push({ src: $r('app.media.loading004') })
    this.images.push({ src: $r('app.media.loading005') })
    this.images.push({ src: $r('app.media.loading006') })
    this.images.push({ src: $r('app.media.loading007') })
    this.images.push({ src: $r('app.media.loading008') })
    this.images.push({ src: $r('app.media.loading009') })
    this.images.push({ src: $r('app.media.loading010') })
    this.images.push({ src: $r('app.media.loading011') })
    this.images.push({ src: $r('app.media.loading012') })
  }

  onPageShow() {
    setInterval(() => {
      this.pageStatus = false;
    }, 5000)
  }

  build() {
    Stack() {

      if (this.pageStatus) {
        ImageAnimatorLoading()
      } else {
        T_14_3_b_h16_v10('1、ImageAnimator基础')
        ImageAnimator()
          .images(this.images)
          .width(USizes.vp50)
          .height(USizes.vp50)
          .duration(1000)
          .state(AnimationStatus.Running)
          .reverse(false)
          .iterations(-1)
      }
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}