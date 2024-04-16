import { tagMsg } from '../wan/utils/Logger';
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextPickerPage {
  @State message: string = 'Hello World';
  @State selectTextPicker: string = '';
  @State showTextPicker: boolean = false;
  private tpArr: string[] = ['测试1', '测试2', '测试3', '测试4', '测试5', '测试6', '测试7'];

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Text(this.message)
        Divider()
          .color(UColors.white)
          .height(USizes.vp16)
        Button('显示选择窗')
          .onClick(() => {
            this.showTextPicker = true;
          })
      }
      .backgroundColor(UColors.white)
      .width(USizes.match_parent)
      .height(USizes.match_parent)
      .zIndex(1)

      Column() {
        Blank()
          .onClick(() => {
            this.showTextPicker = false;
          })
        Column() {
          Row() {
            Text('取消')
              .fontColor(UColors.text_color9)
              .fontSize(USizes.fp14)
              .padding(16)
              .onClick(() => {
                this.showTextPicker = false;
              })
            Blank()
            Text('确定')
              .fontColor(UColors.theme_color)
              .fontSize(USizes.fp14)
              .padding(16)
              .onClick(() => {
                this.showTextPicker = false;
                this.message = this.selectTextPicker;
              })
          }
          .width(USizes.match_parent)

          Divider()
            .color(UColors.white)
            .height(16)

          TextPicker({ range: this.tpArr, selected: 1 })
            .defaultPickerItemHeight(USizes.vp40)
            .onChange((v: string, index: number) => {
              console.debug(tagMsg(`TextPicker${v}->${index}`));
              this.selectTextPicker = v;
            })
          Divider()
            .color(UColors.white)
            .height(16)
        }
        .backgroundColor(UColors.white)
        .width(USizes.match_parent)
        .borderRadius({ topLeft: 10, topRight: 10 })

      }
      .backgroundColor('#99000000')
      .width(USizes.match_parent)
      .height(USizes.match_parent)
      .visibility(this.showTextPicker ? Visibility.Visible : Visibility.Hidden)
      .zIndex(10)
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}