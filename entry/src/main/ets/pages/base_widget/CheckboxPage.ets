import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct CheckboxPage {
  @State checkbox1: boolean = false;
  @State checkbox2: boolean = false;
  @State checkbox3: boolean = false;

  build() {
    Column() {
      T_14_3_b_h16_v10('1、Checkbox')
      Row() {
        Checkbox({ name: '选择', group: '' })
          .select(this.checkbox1)
          .selectedColor(UColors.theme_color)
          .width(USizes.vp20)
          .height(USizes.vp20)
          .onChange((v) => {
            this.checkbox1 = v;
          })
        Text('选择')
          .fontSize(USizes.fp40)
      }
      .padding({ left: USizes.vp16, right: USizes.vp16 })
      .justifyContent(FlexAlign.Center)

      T_14_3_b_h16_v10('2、用户/隐私功能')
      Row() {
        Checkbox({ name: '', group: '' })
          .select(this.checkbox2)
          .selectedColor(UColors.theme_color)
          .width(USizes.vp20)
          .height(USizes.vp20)
          .onChange((v) => {
            this.checkbox2 = v;
          })
        Text() {
          Span('请认真阅读')
            .fontSize(USizes.fp14)
            .fontColor(UColors.text_color3)
          Span('用户协议')
            .fontSize(USizes.fp14)
            .fontColor(UColors.theme_color)
            .onClick(() => {
              showToast('用户协议')
            })
          Span('和')
            .fontSize(USizes.fp14)
            .fontColor(UColors.text_color3)
          Span('隐私协议')
            .fontColor(UColors.theme_color)
            .fontSize(USizes.fp14)
            .onClick(() => {
              showToast('隐私协议')
            })
          Span('，如果您同意相关协议规定，请勾选。测试长文本：，如果您同意相关协议规定，请勾选，如果您同意相关协议规定，请勾选')
            .fontSize(USizes.fp14)
            .fontColor(UColors.text_color3)
        }
        .layoutWeight(1)
        .padding({ top: USizes.vp6 })
      }
      .padding({ left: USizes.vp16, right: USizes.vp16 })
      .alignItems(VerticalAlign.Top)

      T_14_3_b_h16_v10('3、通过Image自定义一个Checkbox')
      ImageCheckbox({
        checkboxStatue: this.checkbox3,
        defImage: $r('app.media.icon_checkbox_select_un'),
        selectImage: $r('app.media.icon_checkbox_select')
      })
        .padding({ left: USizes.vp16, right: USizes.vp16 })

      if (this.checkbox3) {
        Text('选中')
      }

    }
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct ImageCheckbox {
  @Link checkboxStatue: boolean;
  private defImage: string | PixelMap | Resource = undefined;
  private selectImage: string | PixelMap | Resource = undefined;
  private wh: Length = '16vp';

  build() {
    if (this.defImage === undefined || this.checkboxStatue === undefined) {
      Text('x')
        .fontColor(Color.Red)
    } else {
      Image(this.checkboxStatue ? this.selectImage : this.defImage)
        .width(this.wh)
        .height(this.wh)
        .onClick(() => {
          this.checkboxStatue = !this.checkboxStatue;
        })
    }
  }
}