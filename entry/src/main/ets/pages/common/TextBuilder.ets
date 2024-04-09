/*
* a:byc
* time:2024/4/9
* des:
*/
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Builder
export function T_14_3_b_h16_v10(msg: string) {

  Text(msg)
    .fontSize(USizes.fp14)
    .fontColor(UColors.text_color3)
    .fontWeight(FontWeight.Bold)
    .padding({ left: USizes.vp16, top: USizes.vp10, right: USizes.vp16, bottom: USizes.vp10 })

}