import { showToast } from '../wan/utils/ToastUtil'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct BlankPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text('关于')
        .fontSize(USizes.fp16)
        .fontColor(UColors.text_color3)
        .fontWeight(FontWeight.Bold)
        .padding({ top: USizes.vp16, bottom: USizes.vp16 })
      Column() {
        Row()
          .height(USizes.vp50)
        Image($r('app.media.icon'))
          .width(USizes.vp100)
          .height(USizes.vp100)
          .objectFit(ImageFit.Fill)
        Text('当前版本1.0')
          .fontColor(UColors.text_color3)
          .fontSize(USizes.fp12)
          .margin({ top: USizes.vp10 })
        Row() {
          Text('加入我们')
            .fontColor(UColors.text_color3)
            .fontSize(USizes.fp14)
          Blank()
          Image($r('app.media.icon_arrow_next'))
            .width(USizes.vp12)
            .height(USizes.vp12)
        }
        .width(USizes.match_parent)
        .borderRadius(USizes.vp10)
        .padding({ left: USizes.vp12, top: USizes.vp8, right: USizes.vp12, bottom: USizes.vp8 })
        .backgroundColor(UColors.theme_color)
        .constraintSize({ minHeight: USizes.vp50 })
        .margin({ top: USizes.vp20 })

        Row() {
          Text('aaa')
            .fontColor(UColors.text_color3)
            .fontSize(USizes.fp14)
          Blank()
          Image($r('app.media.icon_arrow_next'))
            .width(USizes.vp12)
            .height(USizes.vp12)
        }
        .width(USizes.match_parent)
        .borderRadius(USizes.vp10)
        .padding({ left: USizes.vp12, top: USizes.vp8, right: USizes.vp12, bottom: USizes.vp8 })
        .backgroundColor(UColors.theme_color)
        .constraintSize({ minHeight: USizes.vp50 })
        .margin({ top: USizes.vp10 })

        Text('Blank(min?: number | string)参数作用介绍')
          .fontSize(USizes.fp12)
          .fontColor(UColors.theme_color)
          .alignSelf(ItemAlign.Start)
          .padding({ top: USizes.vp10, bottom: USizes.vp10 })

        Text('1、不使用Blank(min?: number | string)参数')
          .fontSize(USizes.fp12)
          .fontColor(UColors.theme_color)
          .alignSelf(ItemAlign.Start)
          .padding({ top: USizes.vp20, bottom: USizes.vp10 })

        Row() {
          Text('111')
            .fontColor(UColors.text_color3)
            .fontSize(USizes.fp14)

          Blank()
          Text('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb')
            .fontColor(UColors.text_color3)
            .maxLines(1)
            .textAlign(TextAlign.End)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(USizes.fp14)
            .backgroundColor(Color.Green)
        }
        .borderRadius(USizes.vp10)
        .padding({ left: USizes.vp12, top: USizes.vp8, right: USizes.vp12, bottom: USizes.vp8 })
        .backgroundColor(UColors.theme_color)
        .constraintSize({ minHeight: USizes.vp50 })

        Text('2、使用Blank(min?: number | string)参数')
          .fontSize(USizes.fp12)
          .fontColor(UColors.theme_color)
          .alignSelf(ItemAlign.Start)
          .padding({ top: USizes.vp20, bottom: USizes.vp10 })

        Row() {
          Text('aaa')
            .fontColor(UColors.text_color3)
            .fontSize(USizes.fp14)
          Text('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb')
            .fontColor(UColors.text_color3)
            .maxLines(1)
            .layoutWeight(1)
            .margin({ left: USizes.vp100, })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(USizes.fp14)
        }
        .width(USizes.match_parent)
        .borderRadius(USizes.vp10)
        .padding({ left: USizes.vp12, top: USizes.vp8, right: USizes.vp12, bottom: USizes.vp8 })
        .backgroundColor(UColors.white)
        .constraintSize({ minHeight: USizes.vp50 })
        .margin({ top: USizes.vp10 })

        Text('注意:Blank和layoutWeight')
          .fontSize(USizes.fp16)
          .fontColor(UColors.theme_color)
          .padding({ top: USizes.vp20, bottom: USizes.vp10 })

        Blank()

        Text() {
          Span('用户协议')
            .fontColor(UColors.theme_color)
            .fontSize(USizes.fp14)
            .onClick(() => {
              showToast('用户协议')
            })
          Span('和')
            .fontColor(UColors.text_color3)
            .fontSize(USizes.fp14)
          Span('隐私协议')
            .fontColor(UColors.theme_color)
            .fontSize(USizes.fp14)
            .onClick(() => {
              showToast('隐私协议')
            })

        }
        .padding({ top: USizes.vp20, bottom: USizes.vp20 })

      }
      .layoutWeight(1)
      .width(USizes.match_parent)
      .backgroundColor(UColors.common_bg)
      .padding({ left: USizes.vp10, right: USizes.vp10 })
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}