import { T_14_3_b_h16_v10 } from '../common/TextBuilder'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct BadgePage {
  @State message: string = 'Hello World'
  @State defTabIndex: number = 0;
  @State showB: number = 2;

  @Builder
  TabItem(text: string, index: number, defColor: Resource, selColor: Resource, defImage: Resource, selImage: Resource) {
    Column() {
      if (this.showB === index) {
        Badge({
          value: '',
          position: BadgePosition.RightTop,
          style: { color: UColors.white, fontSize: USizes.vp10, badgeSize: USizes.vp8, badgeColor: UColors.theme_color }
        }) {
          Image(this.defTabIndex === index ? selImage : defImage)
            .width(USizes.vp20)
            .height(USizes.vp20)
        }
      } else {
        Image(this.defTabIndex === index ? selImage : defImage)
          .width(USizes.vp20)
          .height(USizes.vp20)
      }
      Row()
        .height(USizes.vp5)
      Text(text)
        .fontColor(this.defTabIndex === index ? selColor : defColor)
        .fontSize(USizes.fp12)
        .opacity(this.defTabIndex === index ? 1 : 0.8)
    }
    .height(USizes.match_parent)
    .justifyContent(FlexAlign.Center)
  }

  onPageShow() {

  }

  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础1')
      Badge({
        count: 100,
        position: BadgePosition.RightTop,
        maxCount: 99,
        style: { color: UColors.white, fontSize: USizes.vp10, badgeSize: USizes.vp14, badgeColor: UColors.theme_color }
      }) {
        Image($r('app.media.icon'))
          .width(USizes.vp40)
          .height(USizes.vp40)
      }
      .width(55)
      .backgroundColor(UColors.text_color9)


      T_14_3_b_h16_v10('2.基础2')
      Badge({
        value: 'new',
        position: BadgePosition.RightTop,
        style: { color: UColors.white, fontSize: USizes.vp10, badgeSize: USizes.vp14, badgeColor: UColors.theme_color }
      }) {
        Image($r('app.media.icon'))
          .width(USizes.vp40)
          .height(USizes.vp40)
      }

      T_14_3_b_h16_v10('3.tab类型消息提醒')
      TextClock()
        .onDateChange((v) => {
          this.showB = (v % 4);
        })
      Tabs() {
        TabContent()
          .tabBar(this.TabItem('首页', 0, UColors.text_color6, UColors.theme_color, $r('app.media.icon'), $r('app.media.icon')))
        TabContent()
          .tabBar(this.TabItem('发现', 1, UColors.text_color6, UColors.theme_color, $r('app.media.icon'), $r('app.media.icon')))
        TabContent()
          .tabBar(this.TabItem('计划', 2, UColors.text_color6, UColors.theme_color, $r('app.media.icon'), $r('app.media.icon')))
        TabContent()
          .tabBar(this.TabItem('我的', 3, UColors.text_color6, UColors.theme_color, $r('app.media.icon'), $r('app.media.icon')))
      }
      .onChange((index: number) => {
        this.defTabIndex = index;
      })
      .width(USizes.match_parent)
      .height('56vp')
      .backgroundColor(UColors.cfef5f5)
      .barMode(BarMode.Fixed)

      T_14_3_b_h16_v10('4.列表信息提醒')

      Stack() {
        Row() {
          Badge({ value: 'NEW', position: BadgePosition.Right, style: { badgeSize: 20 } }) {
            Text('测试列表提醒')
          }
          .width(USizes.match_parent)
          .margin({ right: 16 })
        }
        .justifyContent(FlexAlign.Start)
        .backgroundColor(UColors.text_color9)
        .width(USizes.match_parent)
        .height(USizes.match_parent)
        .borderRadius(25)
        .padding({ left: 12, right: 12 })
      }.width(USizes.match_parent)
      .padding({ left: 16, right: 16 })
      .height(USizes.vp50)

      Divider()
        .color(UColors.white)
        .height(20)
      Stack() {
        Row() {
          Badge({ value: 'NEW', position: BadgePosition.Right, style: { badgeSize: 20 } }) {
            Text('测试列表提醒')
          }
          .width(120)
        }
        .justifyContent(FlexAlign.Start)
        .backgroundColor(UColors.text_color9)
        .width(USizes.match_parent)
        .height(USizes.match_parent)
        .borderRadius(25)
        .padding({ left: 12, right: 12 })
      }.width(USizes.match_parent)
      .padding({ left: 16, right: 16 })
      .height(USizes.vp50)

      T_14_3_b_h16_v10('4.设置页面列表')
      Stack() {
        Column() {
          Row() {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)
            if (this.showB == 0) {
              Badge({
                value: '0',
                position: BadgePosition.Right,
                style: {
                  fontSize: USizes.fp12,
                  badgeSize: USizes.vp12,
                  badgeColor: UColors.theme_color,
                  color: UColors.white
                }
              }) {
                Text('个人信息')
              }
              .layoutWeight(1)
              .margin({ left: 8 })
            } else {
              Text('个人信息')
                .layoutWeight(1)
                .margin({ left: 8 })
            }

            Image($r('app.media.icon_arrow_next'))
              .width(16)
              .height(16)

          }
          .width(USizes.match_parent)
          .justifyContent(FlexAlign.Start)
          .padding({ top: 12, bottom: 12 })

          Divider()
            .color(UColors.text_color9)
            .height(1)
            .margin({ left: 28 })
          Row() {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)
            if (this.showB == 1) {
              Badge({
                value: 'NEW',
                position: BadgePosition.Right,
                style: {
                  fontSize: USizes.fp12,
                  badgeSize: USizes.vp12,
                  badgeColor: UColors.theme_color,
                  color: UColors.white
                }
              }) {
                Text('帮助中心')
              }
              .layoutWeight(1)
              .margin({ left: 8 })
            } else {
              Text('帮助中心')
                .layoutWeight(1)
                .margin({ left: 8 })
            }

            Image($r('app.media.icon_arrow_next'))
              .width(16)
              .height(16)

          }
          .width(USizes.match_parent)
          .justifyContent(FlexAlign.Start)
          .padding({ top: 12, bottom: 12 })

          Divider()
            .color(UColors.text_color9)
            .height(1)
            .margin({ left: 28 })
          Row() {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)
            if (this.showB == 2) {
              Badge({
                count: 1000,
                maxCount: 99,
                position: BadgePosition.Right,
                style: {
                  fontSize: USizes.fp12,
                  badgeSize: USizes.vp12,
                  badgeColor: UColors.theme_color,
                  color: UColors.white
                }
              }) {
                Text('客服')
              }
              .layoutWeight(1)
              .margin({ left: 8 })
            } else {
              Text('客服')
                .layoutWeight(1)
                .margin({ left: 8 })
            }

            Image($r('app.media.icon_arrow_next'))
              .width(16)
              .height(16)

          }
          .width(USizes.match_parent)
          .justifyContent(FlexAlign.Start)
          .padding({ top: 12, bottom: 12 })

          Divider()
            .color(UColors.text_color9)
            .height(1)
            .margin({ left: 28 })
          Row() {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)
            if (this.showB == 3) {
              Badge({
                value: '0',
                position: BadgePosition.Right,
                style: {
                  fontSize: USizes.fp12,
                  badgeSize: USizes.vp12,
                  badgeColor: UColors.theme_color,
                  color: UColors.white
                }
              }) {
                Text('设置')
              }
              .layoutWeight(1)
              .margin({ left: 8 })
            } else {
              Text('设置')
                .layoutWeight(1)
                .margin({ left: 8 })
            }

            Image($r('app.media.icon_arrow_next'))
              .width(16)
              .height(16)

          }
          .width(USizes.match_parent)
          .justifyContent(FlexAlign.Start)
          .padding({ top: 12, bottom: 12 })

          Divider()
            .color(UColors.text_color9)
            .height(1)
            .margin({ left: 28 })

        }
        .backgroundColor(UColors.cfef5f5)
        .borderRadius(10)
        .width(USizes.match_parent)
        .padding(12)

      }
      .width(USizes.match_parent)
      .padding({ left: 16, right: 16 })

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}