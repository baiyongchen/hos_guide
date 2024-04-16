import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { tagMsg } from '../wan/utils/Logger'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextAreaPage {
  @State message: string = 'Hello World'
  private ta1: TextAreaController = new TextAreaController();

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      TextArea({ placeholder: '请输入关键字', text: '', controller: this.ta1 })
        .backgroundColor(UColors.cfef5f5)
        .borderRadius(USizes.vp10)
        .height(USizes.vp100)
        .align(Alignment.Top)
        .textAlign(TextAlign.End)
        .placeholderColor(UColors.text_color9)
        .caretColor(UColors.theme_color)
      T_14_3_b_h16_v10('2.inputFilter')
      TextArea({ placeholder: '请输入关键字', text: '', controller: this.ta1 })
        .backgroundColor(UColors.cfef5f5)
        .borderRadius(USizes.vp10)
        .height(USizes.vp100)
        .align(Alignment.Top)
        .textAlign(TextAlign.End)
        .placeholderColor(UColors.text_color9)
        .caretColor(UColors.theme_color)
        .inputFilter("[a-z]", (errorMsg) => {
          //重复不会调用 如上 连续输入111 只打印第一次出现
          console.debug(tagMsg(JSON.stringify(errorMsg)));
        })
    }
    .padding({ left: USizes.vp16, right: USizes.vp16 })
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}