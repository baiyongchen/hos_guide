import router from '@ohos.router'
import { CrForEachChildText } from './CrForEachChildText'

@Entry
@Preview
@Component
struct CrForEach1 {
  private title: string = '标题'
  private dataArr: string[] = ['one', 'two', 'two', 'there']

  aboutToAppear() {
    this.title = router.getParams()['title']
  }

  build() {
    Column() {
      Text(this.title)
        .height('50vp')
        .width('100%')
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
      Text('当不同数组项按照键值生成规则生成的键值相同时，框架的行为是未定义的。')
        .padding({ right: '16vp', left: '16vp' })
        .fontSize('14fp')
        .fontColor('#666')

      Scroll() {
        Column({ space: '20vp' }) {
          ForEach(this.dataArr, (item: string, index: number) => {
            CrForEachChildText({ item: item })
          }, (item: string, index: number) => {
            return item;
          })
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)

    }
    .width('100%')
    .height('100%')
  }
}