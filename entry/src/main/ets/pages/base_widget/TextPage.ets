import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TextPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      Text('aaaaaaaaaaa')
      T_14_3_b_h16_v10('2.textAlign/align配合使用')
      Text('aaaaaaaaaaa')
        .width(USizes.match_parent)
        .height(USizes.vp50)
        .backgroundColor(UColors.cfef5f5)
        .textAlign(TextAlign.End)//控制水平方向
        .align(Alignment.TopEnd) //控制垂直方向

      T_14_3_b_h16_v10('3.textOverflow/maxLines配合使用')
      Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        .width(USizes.vp200)
        .height(USizes.vp50)
        .maxLines(1)
        .align(Alignment.Top)
        .textOverflow({ overflow: TextOverflow.None })
        .backgroundColor(UColors.cfef5f5)

      T_14_3_b_h16_v10('4.lineHeight')
      Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        .width(USizes.vp200)
        .height(USizes.vp50)
        .align(Alignment.Top)
        .lineHeight(20)
        .backgroundColor(UColors.cfef5f5)

      T_14_3_b_h16_v10('5.decoration')
      Text('None')
        .decoration({ type: TextDecorationType.None, color: UColors.theme_color })
      Text('Underline')
        .decoration({ type: TextDecorationType.Underline, color: UColors.theme_color })
      Text('Overline')
        .decoration({ type: TextDecorationType.Overline, color: UColors.theme_color })
      Text('LineThrough')
        .decoration({ type: TextDecorationType.LineThrough, color: UColors.theme_color })
      T_14_3_b_h16_v10('6.baselineOffset')
      Row() {
        Text('baselineOffset0')
          .baselineOffset(0)
          .decoration({ type: TextDecorationType.None, color: UColors.theme_color })
        Text('baselineOffset20')
          .baselineOffset(-20)
          .backgroundColor(UColors.cfef5f5)
      }

      T_14_3_b_h16_v10('7.letterSpacing')
      Row() {
        Text('letterSpacing0')
          .letterSpacing(0)
        Text('letterSpacing3')
          .letterSpacing(3)
      }

      T_14_3_b_h16_v10('8.minFontSize/maxFontSize/maxline')
      Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width(USizes.vp200)
        .height(USizes.vp30)
        .minFontSize(USizes.fp8)
        .maxFontSize(USizes.fp20)
        .backgroundColor(UColors.cfef5f5)
        .align(Alignment.Top)
      T_14_3_b_h16_v10('9.textCase')
      Row() {
        Text('Normal')
          .textCase(TextCase.Normal)
        Divider()
          .width(5)
          .color(Color.White)
        Text('LowerCase')
          .textCase(TextCase.LowerCase)
        Divider()
          .width(5)
          .color(Color.White)
        Text('UpperCase')
          .textCase(TextCase.UpperCase)
      }

      T_14_3_b_h16_v10('10.copyOption')
      Text('copyOption')
        .copyOption(CopyOptions.InApp)

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}