import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct SelectPage {
  @State message: string = 'Hello World'
  private selectList: Array<SelectOption> = [];

  aboutToAppear() {
    this.selectList.push({ value: 'loading1', icon: $r('app.media.loading001') })
    this.selectList.push({ value: 'loading2', icon: $r('app.media.loading002') })
    this.selectList.push({ value: 'loading3', icon: $r('app.media.loading003') })
    this.selectList.push({ value: 'loading4', icon: $r('app.media.loading004') })
    this.selectList.push({ value: 'loading5', icon: $r('app.media.loading005') })
    this.selectList.push({ value: 'loading6', icon: $r('app.media.loading006') })
    this.selectList.push({ value: 'loading7', icon: $r('app.media.loading007') })
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      Select(this.selectList)
        .backgroundColor(UColors.theme_color)
        .width(USizes.vp200)

      T_14_3_b_h16_v10('2.selected')
      Select(this.selectList)
        .backgroundColor(UColors.theme_color)
        .width(USizes.vp200)
        .value('')
        .selected(8)
      T_14_3_b_h16_v10('3.font')
      Select(this.selectList)
        .backgroundColor(UColors.theme_color)
        .width(USizes.vp200)
        .value('')
        .selected(2)
        .font({ size: USizes.fp18, weight: FontWeight.Bold })
        .fontColor(UColors.white)
      T_14_3_b_h16_v10('4.selectedOption')
      Select(this.selectList)
        .backgroundColor(UColors.theme_color)
        .width(USizes.vp200)
        .value('')
        .selected(2)
        .font({ size: USizes.fp18, weight: FontWeight.Bold })
        .fontColor(UColors.white)
        .selectedOptionBgColor(UColors.theme_color)
        .selectedOptionFont({ size: USizes.fp14, weight: FontWeight.Bold })
        .selectedOptionFontColor(UColors.text_color3)
      T_14_3_b_h16_v10('5.option')
      Select(this.selectList)
        .backgroundColor(UColors.theme_color)
        .width(USizes.vp200)
        .value('')
        .selected(2)
        .font({ size: USizes.fp18, weight: FontWeight.Bold })
        .fontColor(UColors.white)
        .selectedOptionBgColor(UColors.theme_color)
        .selectedOptionFont({ size: USizes.fp14, weight: FontWeight.Bold })
        .selectedOptionFontColor(UColors.text_color3)
        .optionBgColor(UColors.white)
        .optionFont({ size: USizes.fp14, weight: FontWeight.Bold })
        .optionFontColor(UColors.text_color6)
        .onSelect((index: number, v: string) => {
          showToast(`${index}:${v}`)
        })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}