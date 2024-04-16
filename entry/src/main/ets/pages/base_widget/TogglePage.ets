import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct TogglePage {
  @State message: string = 'Hello World'
  @State tck: boolean = false;
  @State tb: boolean = false;
  @State ts: boolean = false;

  build() {
    Column() {
      T_14_3_b_h16_v10('1.Toggle_Checkbox')
      Toggle({ type: ToggleType.Checkbox, isOn: this.tck })
        .selectedColor(UColors.theme_color)
      T_14_3_b_h16_v10('2.Toggle_Switch')
      Toggle({ type: ToggleType.Switch, isOn: this.ts })
        .selectedColor(Color.Blue)
        .switchPointColor(UColors.white)
      T_14_3_b_h16_v10('3.Toggle_Button')
      Toggle({ type: ToggleType.Button, isOn: this.tb }) {
        Text(this.tb ? '选中' : '未选中')
          .fontColor(this.tb ? Color.White : Color.Black)
      }
      .size({ width: USizes.vp60, height: USizes.vp30 })
      .selectedColor(Color.Blue)
      .onChange((isOn) => {
        this.tb = isOn;
      })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}