import router from '@ohos.router'
import { CrForEachChildText } from './CrForEachChildText'

@Entry
@Preview
@Component
struct CrForEach1 {
  private title: string = '标题'
  private dataArr: string[] = []

  aboutToAppear() {
    this.title = router.getParams()['title']

    for (let index = 0; index < 20; index++) {
      this.dataArr.push(`ArkUI${index}`)
    }
  }

  build() {
    Column() {
      Text(this.title)
        .height('50vp')
        .width('100%')
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
      Text('在ForEach首次渲染时，会根据前述键值生成规则为数据源的每个数组项生成唯一键值，并创建相应的组件。')
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

    }
    .width('100%')
    .height('100%')
  }
}