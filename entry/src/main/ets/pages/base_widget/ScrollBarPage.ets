import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes';

@Entry
@Component
struct ScrollBarPage {
  @State message: string = 'Hello World'
  private listArr: number[] = [];
  private listSc: Scroller = new Scroller();

  aboutToAppear() {
    for (let index = 0; index < 50; index++) {
      this.listArr.push(index);
    }
  }

  build() {
    Stack({ alignContent: Alignment.End }) {
      List({
        initialIndex: 0,
        scroller: this.listSc
      }) {
        ForEach(this.listArr, (item: number, index: number) => {
          ListItem() {
            Text(`${item}`)
              .textAlign(TextAlign.Center)
              .width(USizes.match_parent)
          }
        }, (item: number, index: number) => {
          return `${item}`;
        })
      }
      .divider({ strokeWidth: 20, color: UColors.white })
      .width(USizes.match_parent)
      .height(USizes.match_parent)

      ScrollBar({ scroller: this.listSc, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
        Text()
          .width(20)
          .height(100)
          .borderRadius(10)
          .backgroundColor('#C0C0C0')
      }
      .alignSelf(ItemAlign.End)
    }
  }
}