import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { showToast } from '../wan/utils/ToastUtil'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct RadioPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      T_14_3_b_h16_v10('1、基础')
      Row() {
        Radio({ value: '基础', group: '基础' })
        Text('基础')
      }

      T_14_3_b_h16_v10('2、分组')
      Row() {
        Radio({ value: '分组1', group: '分组1' })
        Text('分组1')
      }

      Row() {
        Radio({ value: '分组2', group: '分组1' })
        Text('分组2')
      }

      Row() {
        Radio({ value: '分组2', group: '分组1' })
        Text('分组2')
      }

      T_14_3_b_h16_v10('3、默认选中')
      Radio({ value: '基础1', group: '基础1' })
        .checked(true)

      T_14_3_b_h16_v10('4、选中状态监听')
      Radio({ value: '基础2', group: '基础2' })
        .onChange((c) => {
          showToast(`${c}`)
        })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}