import { showToast } from '../wan/utils/ToastUtil'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct NavigationPage {
  @State message: string = 'Hello World'

  @Builder
  navigationTitle() {
    Text('Navigation title CustomBuilder')
      .fontColor(UColors.white)
  }

  @Builder
  menusCom() {
    Image($r('app.media.icon'))
      .width(USizes.vp20)
      .height(USizes.vp20)
  }

  @Builder
  MToolBar() {
    Row() {
      Column() {
        Image($r('app.media.icon'))
          .width(USizes.vp20)
          .height(USizes.vp20)
        Divider()
          .color(Color.White)
          .height(USizes.vp6)
          .width(USizes.vp20)
        Text('首页')
          .fontColor(UColors.text_color6)
          .fontSize(USizes.fp12)
      }

      Column() {
        Image($r('app.media.icon'))
          .width(USizes.vp20)
          .height(USizes.vp20)
        Divider()
          .color(Color.White)
          .height(USizes.vp6)
          .width(USizes.vp20)
        Text('课堂')
          .fontColor(UColors.text_color6)
          .fontSize(USizes.fp12)
      }

      Column() {
        Image($r('app.media.icon'))
          .width(USizes.vp20)
          .height(USizes.vp20)
        Divider()
          .color(Color.White)
          .height(USizes.vp6)
          .width(USizes.vp20)
        Text('规划')
          .fontColor(UColors.text_color6)
          .fontSize(USizes.fp12)
      }

      Column() {
        Image($r('app.media.icon'))
          .width(USizes.vp20)
          .height(USizes.vp20)
        Divider()
          .color(Color.White)
          .height(USizes.vp6)
          .width(USizes.vp20)
        Text('志愿')
          .fontColor(UColors.text_color6)
          .fontSize(USizes.fp12)
      }

      Column() {
        Image($r('app.media.icon'))
          .width(USizes.vp20)
          .height(USizes.vp20)
        Divider()
          .color(Color.White)
          .height(USizes.vp6)
          .width(USizes.vp20)
        Text('我的')
          .fontColor(UColors.text_color6)
          .fontSize(USizes.fp12)
      }
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width(USizes.match_parent)
    .height(USizes.vp50)
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      Navigation()//.title('Navigation')
        //.title(this.navigationTitle())
        //.title({ builder: this.navigationTitle(), height: TitleHeight.MainOnly })
        .title({ main: 'aaa', sub: 'bbb' })
        .menus([{
          value: 'aaaa',
          icon: 'https://ts1.cn.mm.bing.net/th/id/R-C.80ba046f8bb6e6df41a88bb3956441c5?rik=so9s3w2Xzo9euQ&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f7e%2f2b%2f820b-ec18-45b3-a176-e12c1cdd5cb966%2fimageView%2fv1%2fthumbnail%2f640x0&ehk=UXt3yu%2f1VP5lEJ5jWGl91oNfNCNvoiHxUjwCAhxotYw%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
          action: () => {
            showToast('aaaa')
          }
        }, {
          value: 'bbbb',
          icon: 'https://ts1.cn.mm.bing.net/th/id/R-C.80ba046f8bb6e6df41a88bb3956441c5?rik=so9s3w2Xzo9euQ&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f7e%2f2b%2f820b-ec18-45b3-a176-e12c1cdd5cb966%2fimageView%2fv1%2fthumbnail%2f640x0&ehk=UXt3yu%2f1VP5lEJ5jWGl91oNfNCNvoiHxUjwCAhxotYw%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
          action: () => {
            showToast('bbbb')
          }
        }, {
          value: 'cccc',
          icon: 'https://ts1.cn.mm.bing.net/th/id/R-C.80ba046f8bb6e6df41a88bb3956441c5?rik=so9s3w2Xzo9euQ&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f7e%2f2b%2f820b-ec18-45b3-a176-e12c1cdd5cb966%2fimageView%2fv1%2fthumbnail%2f640x0&ehk=UXt3yu%2f1VP5lEJ5jWGl91oNfNCNvoiHxUjwCAhxotYw%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
          action: () => {
            showToast('cccc')
          }
        }])
        .titleMode(NavigationTitleMode.Mini)
        .toolBar(this.MToolBar())
        .backgroundColor(Color.Green)
        .hideBackButton(true)
        .mode(NavigationMode.Stack)

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}