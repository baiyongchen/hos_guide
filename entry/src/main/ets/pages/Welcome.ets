import router from '@ohos.router'

@Entry
@Component
struct Welcome {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Button('玩Android').onClick(() => {
        router.pushUrl({ url: "pages/wan/WanIndex" })
      })
      Divider().vertical(true).height(20).color(Color.Green)
      Button('使用指南').onClick(() => {
        router.pushUrl({ url: "pages/guide/GuideIndex" })
      })
      Divider().vertical(true).height(20).color(Color.Green)
      Button('基础组件').onClick(() => {
        router.pushUrl({ url: "pages/base_widget/BaseWidgets" })
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.Center)
  }
}