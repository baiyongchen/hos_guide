/*
* a:byc
* time:2024/4/2
* des:
*/
import UColors from '../../../utils/UColors'
import USizes from '../../../utils/USizes'

@Preview
@Component
export struct AccountComponent {
  build() {
    Column() {
      TextInput({ placeholder: $r('app.string.login_account_hint') })
        .width(USizes.match_parent)
        .height(USizes.vp50)
        .padding('0vp')

      Divider()
        .width(USizes.match_parent)
        .height(USizes.vp1)
        .color(UColors.text_color9)
        .alignSelf(ItemAlign.Center)
    }
    .padding({ left: USizes.vp16 })
  }
}