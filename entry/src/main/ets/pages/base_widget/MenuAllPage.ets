import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import { tagMsg } from '../wan/utils/Logger'
import { showToast } from '../wan/utils/ToastUtil'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct MenuAllPage {
  private startIcon: ResourceStr = $r('app.media.app_icon')
  private endIcon: ResourceStr = $r('app.media.icon_arrow_next')
  @State bbbStatus: boolean = false;

  @Builder
  MyMenuItem() {
    Menu() {
      MenuItem({
        startIcon: this.startIcon,
        content: 'aaa',
        endIcon: this.endIcon,
        labelInfo: '111',
        builder: this.MyMenuItemSub.bind(this)
      })
      MenuItem({
        startIcon: this.startIcon,
        content: 'bbb',
        endIcon: this.endIcon,
        labelInfo: '222',
        builder: null
      })
        .onChange((s) => {
          this.bbbStatus = s;
          console.debug(tagMsg(s ? '选中' : '未选中'))
        })
        .selected(this.bbbStatus)
        .selectIcon(this.bbbStatus)
      MenuItem({
        startIcon: this.startIcon,
        content: 'ccc',
        endIcon: this.endIcon,
        labelInfo: '333',
        builder: null
      })
        .selected(true)
        .selectIcon(true)
    }
  }

  @Builder
  MyMenuItemSub() {
    Menu() {
      MenuItem({
        startIcon: this.startIcon,
        content: 'ccc1',
        endIcon: this.endIcon,
        labelInfo: '333111',
        builder: null
      })
      MenuItem({
        startIcon: this.startIcon,
        content: 'ccc2',
        endIcon: this.endIcon,
        labelInfo: '333222',
        builder: null
      })
    }
  }

  @Builder
  MyMenuItemGroup() {
    Menu() {
      MenuItem({
        startIcon: this.startIcon,
        content: 'aaa',
        endIcon: this.endIcon,
        labelInfo: '111',
        builder: this.MyMenuItemSub.bind(this)
      })
      MenuItem({
        startIcon: this.startIcon,
        content: 'bbb',
        endIcon: this.endIcon,
        labelInfo: '222',
        builder: this.MyMenuItemSub.bind(this)
      })
      MenuItemGroup({ header: '头部', footer: '尾部' }) {
        MenuItem({
          startIcon: this.startIcon,
          content: 'ccc',
          endIcon: this.endIcon,
          labelInfo: '333',
          builder: this.MyMenuItemSub.bind(this)
        })
        MenuItem({
          startIcon: this.startIcon,
          content: 'ddd',
          endIcon: this.endIcon,
          labelInfo: '444',
          builder: this.MyMenuItemSub.bind(this)
        })
      }
    }
  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1、Menu')
      Button('显示Menu')
        .bindMenu([{ value: 'aaa', action: () => {
          showToast('aaa');
        } }, { value: 'bbb', action: () => {
          showToast('bbb');
        } }, { value: 'ccc', action: () => {
          showToast('ccc');
        } }, { value: 'ddd', action: () => {
          showToast('ddd');
        } }])
      T_14_3_b_h16_v10('2、MenuItem')
      Button('显示MenuItem')
        .bindMenu(this.MyMenuItem())
      T_14_3_b_h16_v10('3、MenuItemGroup')
      Button('显示MenuItemGroup')
        .bindMenu(this.MyMenuItemGroup())
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}