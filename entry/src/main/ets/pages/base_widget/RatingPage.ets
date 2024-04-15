import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct RatingPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基础')
      Rating({ rating: 2, indicator: false })

      T_14_3_b_h16_v10('2、指示器')
      Rating({ rating: 3, indicator: false })
        .stepSize(1)
        .starStyle({
          backgroundUri: '/string_image/icon_checkbox_select1_un.png',
          foregroundUri: '/string_image/icon_checkbox_select1.png'
        })
        .height(USizes.vp20)
        .onChange((v) => {
          showToast(`${v}`)
        })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}