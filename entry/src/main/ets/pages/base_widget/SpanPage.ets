import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct SpanPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      Text() {
        Span('aa')
      }

      T_14_3_b_h16_v10('2.decoration')
      Text() {
        Span('None')
          .decoration({ type: TextDecorationType.None, color: UColors.theme_color })
        Span('Underline')
          .decoration({ type: TextDecorationType.Underline, color: UColors.theme_color })
        Span('Overline')
          .decoration({ type: TextDecorationType.Overline, color: UColors.theme_color })
        Span('LineThrough')
          .decoration({ type: TextDecorationType.LineThrough, color: UColors.theme_color })
      }

      T_14_3_b_h16_v10('3.letterSpacing')
      Text() {
        Span('LineThrough')
          .decoration({ type: TextDecorationType.LineThrough, color: UColors.theme_color })
          .letterSpacing(2)
      }

      T_14_3_b_h16_v10('4.textCase')
      Text() {
        Span('None')
          .decoration({ type: TextDecorationType.None, color: UColors.theme_color })
          .textCase(TextCase.Normal)
        Span('Underline')
          .decoration({ type: TextDecorationType.Underline, color: UColors.theme_color })
          .textCase(TextCase.LowerCase)
        Span('Overline')
          .decoration({ type: TextDecorationType.Overline, color: UColors.theme_color })
          .textCase(TextCase.UpperCase)
      }
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}