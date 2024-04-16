import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { tagMsg } from '../wan/utils/Logger';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextInputPage {
  @State message: string = 'Hello World'
  private tc1: TextInputController = new TextInputController();

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
      T_14_3_b_h16_v10('2.placeholder')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
      T_14_3_b_h16_v10('3.enterKeyType')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .enterKeyType(EnterKeyType.Search)
      T_14_3_b_h16_v10('4.caretColor')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .enterKeyType(EnterKeyType.Search)
        .caretColor(UColors.theme_color)
      T_14_3_b_h16_v10('5.maxLength')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .enterKeyType(EnterKeyType.Search)
        .caretColor(UColors.theme_color)
        .maxLength(10)
      T_14_3_b_h16_v10('6.inputFilter')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .enterKeyType(EnterKeyType.Search)
        .caretColor(UColors.theme_color)
        .maxLength(10)
        .inputFilter('[0-9]', (errorMsg) => {
          console.debug(tagMsg(JSON.stringify(errorMsg)))
        })
      T_14_3_b_h16_v10('7.type')
      TextInput({ placeholder: '请输入账号', text: '', controller: this.tc1 })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .enterKeyType(EnterKeyType.Search)
        .caretColor(UColors.theme_color)
        .maxLength(10)
        .inputFilter('[0-9]', (errorMsg) => {
          console.debug(tagMsg(JSON.stringify(errorMsg)))
        })
        .type(InputType.Password)
        .showPasswordIcon(false)

    }
    .padding({ left: USizes.vp16, right: USizes.vp16 })
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}