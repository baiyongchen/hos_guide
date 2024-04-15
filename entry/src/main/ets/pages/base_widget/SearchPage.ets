import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct SearchPage {
  private mSearchController: SearchController = new SearchController();

  aboutToAppear() {
    this.mSearchController.caretPosition(5)
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1/基础')
      Search({
        value: 'aaaaaaaaaaaa',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
      Button('移动光标')
        .onClick(() => {
          this.mSearchController.caretPosition(5)
        })

      T_14_3_b_h16_v10('2/searchButton')
      Search({
        value: '',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
        .searchButton('搜索')
        .onSubmit((v) => {
          showToast(v);
        })

      T_14_3_b_h16_v10('3/placeholder')
      Search({
        value: '',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
        .searchButton('搜索')
        .onSubmit((v) => {
          showToast(v);
        })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })

      T_14_3_b_h16_v10('4/textFont')
      Search({
        value: '',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
        .searchButton('搜索')
        .onSubmit((v) => {
          showToast(v);
        })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .textFont({ size: USizes.fp16 })

      T_14_3_b_h16_v10('5/textAlign')
      Search({
        value: '',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
        .searchButton('搜索')
        .onSubmit((v) => {
          showToast(v);
        })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .textFont({ size: USizes.fp16 })
        .textAlign(TextAlign.End)
        .copyOption(CopyOptions.None)

      T_14_3_b_h16_v10('5/copyOption')
      Search({
        value: '',
        placeholder: '请输入院校名称',
        icon: '/string_image/icon_checkbox_select1.png',
        controller: this.mSearchController
      })
        .margin({ left: 20, right: 20 })
        .backgroundColor(UColors.cfef5f5)
        .searchButton('搜索')
        .onSubmit((v) => {
          showToast(v);
        })
        .placeholderColor(UColors.text_color9)
        .placeholderFont({ size: USizes.fp14, weight: FontWeight.Normal })
        .textFont({ size: USizes.fp16 })
        .copyOption(CopyOptions.InApp)
        .onCopy((v) => {
          showToast(`复制${v}`)
        })
        .onCut((v) => {
          showToast(`剪切${v}`)
        })
        .onPaste((v) => {
          showToast(`粘贴${v}`)
        })
    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}