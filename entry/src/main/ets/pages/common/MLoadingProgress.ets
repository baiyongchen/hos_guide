/*
* a:byc
* time:2024/4/11
* des:自定义一个LoadingProgress
*/

@Preview
@Component
export struct MLoadingProgress {
  build() {

    Column() {
      LoadingProgress()
        .width('50vp')
        .height('50vp')
        .color(Color.Black)
      Text('加载中...')
        .fontColor(Color.Black)
        .fontSize('16fp')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')

  }
}