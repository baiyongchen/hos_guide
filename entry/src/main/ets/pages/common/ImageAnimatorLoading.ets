/*
* a:byc
* time:2024/4/11
* des:帧动画loading
*/

@Preview
@Component
export struct ImageAnimatorLoading {
  private images: Array<ImageFrameInfo> = [];

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

  build() {
    Stack({ alignContent: Alignment.Center }) {
      ImageAnimator()
        .images(this.images)
        .width('50vp')
        .height('50vp')
        .duration(1000)
        .state(AnimationStatus.Running)
        .reverse(false)
        .iterations(-1)
    }
    .width('100%')
    .height('100%')
  }
}