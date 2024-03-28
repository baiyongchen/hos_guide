/*
* a:byc
* time:2024/3/28
* des:
*/
@Preview
@Component
export struct CrForEachChildText {
  private item: string = 'aaa'

  build() {
    Text(this.item)
      .width('80%')
      .height('80vp')
      .fontSize('14fp')
      .fontColor(Color.White)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Blue)
      .border({ radius: '10vp' })
  }
}