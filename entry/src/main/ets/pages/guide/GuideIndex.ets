import router from '@ohos.router';

@Entry
@Component
struct Index {
  private indexScroller: Scroller = new Scroller();

  @Styles
  OneText(){
    .width('100%')
    .height('32vp')
    .padding({ left: '16vp', right: '16vp' })
  }

  @Styles
  TwoText(){
    .width('100%')
    .height('32vp')
    .padding({ left: '32vp', right: '16vp' })
  }

  @Styles
  ThereText(){
    .width('100%')
    .height('32vp')
    .padding({ left: '48vp', right: '16vp' })
  }

  @Styles
  normalStyle() {
    .backgroundColor('#f5f5f5')
  }

  @Styles
  pressedStyle(){
    .backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Text('HarmonyOS指南')
        .width('100%')
        .height('50vp')
        .fontColor('#333')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
      Scroll(this.indexScroller) {
        Column() {

          Text('状态管理')
            .OneText()
          Text('状态管理概述')
            .TwoText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/state_manager/StateManager1' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('管理组件拥有的状态')
            .TwoText()

          Text('@State装饰器：组件内状态')
            .ThereText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/state_manager/StateManager2' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('@Prop装饰器：父子单向同步')
            .ThereText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/state_manager/StateManager3' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('@Link装饰器：父子双向同步')
            .ThereText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/state_manager/StateManager4' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('状态管理')
            .OneText()

          Text('if/else：条件渲染')
            .TwoText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/guide/condition_render/CrIfElse' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('ForEach：循环渲染')
            .TwoText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/guide/condition_render/CrForEach' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

          Text('LazyForEach：数据懒加载')
            .TwoText()
            .onClick(() => {
              router.pushUrl({ url: 'pages/guide/condition_render/CrLazyForEach' })
            })
            .stateStyles({
              normal: this.normalStyle,
              pressed: this.pressedStyle
            })

        }
      }
      .scrollable(ScrollDirection.Vertical)
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}