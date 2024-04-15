import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct RichTextPage {
  @State message: string = 'Hello World'
  @State loading: boolean = true;
  private rcSc: Scroller = new Scroller();

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Stack({ alignContent: Alignment.Center }) {
        LoadingProgress()
          .color(UColors.theme_color)
          .width(USizes.vp50)
          .height(USizes.vp50)
      }
      .width(USizes.match_parent)
      .height(USizes.match_parent)
      .zIndex(10)
      .visibility(this.loading ? Visibility.Visible : Visibility.Hidden)
      .backgroundColor(Color.White)

      Scroll(this.rcSc) {
        RichText(`<h1 style="text-align: center;">h1标题</h1>' +
  '<h1 style="text-align: center;"><i>h1斜体</i></h1>' +
  '<h1 style="text-align: center;"><u>h1下划线</u></h1>' +
  '<h2 style="text-align: center;">h2标题</h2>' +
  '<h3 style="text-align: center;">h3标题</h3>' +
  '<p style="text-align: center;">p常规</p><hr/>' +
  '<div style="width: 500px;height: 500px;border: 1px solid;margin: 0auto;">' +
  '<p style="font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)">字体大小35px,行高45px</p>' +
  '<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' +
  '<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>`)
          .onStart(() => {

          })
          .onComplete(() => {
            this.loading = false;
          })
      }
      .height(USizes.match_parent)
      .zIndex(1)
      .visibility(this.loading ? Visibility.Hidden : Visibility.Visible)
      .width(USizes.match_parent)
      .scrollable(ScrollDirection.Vertical)
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}