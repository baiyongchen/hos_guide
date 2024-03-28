@Entry
@Component
struct CrLazyForEach {
  private lazyFe: string[] = [
    '首次渲染1',
    '首次渲染2',
    '首次渲染3',
    '首次渲染4',
    '首次渲染5',
    '首次渲染6',
    '首次渲染7',
    '首次渲染8',
    '首次渲染9',
    '首次渲染10',
    '首次渲染11'
  ];

  build() {
    List({ space: 20, initialIndex: 0 }) {
      ForEach(this.lazyFe, (item: string, index: number) => {
        ListItem() {
          Text('' + item)
            .width('100%')
            .height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
            .onClick(() => {
              console.info(item)
            })
        }
      }, (item: string, index: number) => {
        return item;
      })
    }
    .listDirection(Axis.Vertical) // 排列方向
    .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
    .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
    .onScrollIndex((firstIndex: number, lastIndex: number) => {
      console.info('first' + firstIndex)
      console.info('last' + lastIndex)
    })
    .width('100%')
    .height('100%')
  }
}
