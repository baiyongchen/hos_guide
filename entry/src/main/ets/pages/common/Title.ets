/*
* a:byc
* time:2024/4/1
* des:
*/

@Preview
@Component
export struct Title {
  private bg: Color | number | string | Resource = '#FFFFFF';
  private title: string | Resource = '详情';
  private back: string | Resource = $r('app.media.icon_arrow_back_black')
  private backVisibility: Visibility = Visibility.Visible
  private backClick: () => void
  private next: string | Resource = ''
  private nextClick: () => {}
  private nextVisibility: Visibility = Visibility.Hidden

  build() {
    Row() {
      Stack({ alignContent: Alignment.Center }) {
        Image(this.back)
          .height('20vp')
          .width('20vp')
      }
      .height('100%')
      .padding({ left: '16vp', right: '16vp' })
      .onClick(this.backClick)
      .visibility(this.backVisibility)

      Text(this.title)
        .textAlign(TextAlign.Center)
        .fontColor('#333333')
        .fontWeight(FontWeight.Bold)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)

      Stack({ alignContent: Alignment.Center }) {
        Image(this.next)
          .height('20vp')
          .width('20vp')
      }
      .height('100%')
      .padding({ left: '16vp', right: '16vp' })
      .onClick(this.nextClick)
      .visibility(this.nextVisibility)
    }
    .width('100%')
    .height('50vp')
    .backgroundColor(this.bg)
    .alignItems(VerticalAlign.Center)
  }
}