import { T_14_3_b_h16_v10 } from '../common/TextBuilder';
import { showToast } from '../wan/utils/ToastUtil';
import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct CounterPage {
  @State message: number = 1;
  private basePrice = 1999.9;
  @State price: number = 0;

  aboutToAppear() {
    this.price = this.basePrice * this.message;
  }

  //购物车场景
  //尝试模仿京东购物车场景
  build() {
    Column() {
      T_14_3_b_h16_v10('1.基础')
      Counter() {
        Text(this.message.toString())
      }
      .onInc(() => {
        this.message += 1;
      })
      .onDec(() => {
        if (this.message != 0) {
          this.message -= 1;
        }
      })

      T_14_3_b_h16_v10('2.模仿京东购物车')

      Row() {
        Row() {
          Text('图标')
            .fontSize(16)
            .fontColor(UColors.text_color3)
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .size({ width: 100, height: 100 })
        .backgroundColor(UColors.cfef5f5)
        .borderRadius(10)
        .borderWidth(1)
        .borderColor(UColors.theme_color)

        Column() {
          Text('Apple苹果2023款 mini版本 优惠多多 更紧选购吧')
            .fontColor(UColors.text_color3)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text('银色，店内爆款【8G+1T+GX700}测试版本多多文案文案文案文案')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(10)
            .fontColor(UColors.text_color9)
            .maxLines(1)
            .margin({ top: 4 })
            .backgroundColor(UColors.cf6f6f6)
            .padding({ left: 4, top: 2, right: 4, bottom: 2 })
            .borderRadius(3)
          Text('7天保价')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(10)
            .fontColor(UColors.theme_color)
            .maxLines(1)
            .margin({ top: 4 })
            .backgroundColor(UColors.cfef5f5)
            .padding({ left: 4, top: 2, right: 4, bottom: 2 })
            .borderRadius(3)
            .borderWidth(1)
            .borderColor(UColors.theme_color)
          Row() {
            Text() {
              Span('￥')
                .fontSize(10)
                .fontColor(UColors.theme_color)
              Span(this.price.toFixed(1))
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(UColors.theme_color)
              Span('到手价')
                .fontSize(10)
                .fontColor(UColors.theme_color)
            }

            Blank()
            /**
             * 默认值太恶心了
             */
            Counter() {
              Text(this.message.toString())
                .fontSize(14)
                .fontColor(UColors.text_color3)
            }
            .onInc(() => {
              this.message += 1;
              this.price = this.basePrice * this.message;
            })
            .onDec(() => {
              if (this.message > 1) {
                this.message -= 1;
                this.price = this.basePrice * this.message;
              }
            })
          }
          .width(USizes.match_parent)

          Text() {
            Span('￥')
              .fontSize(10)
              .fontColor(UColors.text_color9)
            Span(this.price.toFixed(1))
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor(UColors.text_color9)
          }

          Row() {
            Text('满一件可换购')
              .fontSize(USizes.fp12)
              .fontColor(UColors.text_color3)
              .fontWeight(FontWeight.Bold)
            Blank()
            Text('去换购 >')
              .fontSize(USizes.fp12)
              .fontColor(UColors.text_color3)
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                showToast('去换购');
              })
          }
          .width(USizes.match_parent)
          .margin({ top: 4 })
        }
        .layoutWeight(1)
        .margin({ left: 10, top: 5 })
        .alignItems(HorizontalAlign.Start)
      }
      .alignItems(VerticalAlign.Top)
      .width(USizes.match_parent)
      .borderRadius(10)
      .borderWidth(1)
      .backgroundColor(UColors.white)
      .padding({ left: 12, top: 8, right: 12, bottom: 8 })
      .borderColor(UColors.theme_color)

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
    .padding({ left: 16, right: 16 })
    .backgroundColor(UColors.cf6f6f6)
  }
}