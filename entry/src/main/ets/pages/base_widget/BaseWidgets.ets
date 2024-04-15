import router from '@ohos.router'
import { Level } from '@ohos/hypium'
import { RouterUtils } from '../wan/utils/RouterUtils'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct BaseWidgets {
  @State widgetsArr: WidgetBean[] = []

  onPageShow() {

    setInterval(() => {
      this.widgetsArr.push(
        new WidgetBean('AlphabetIndexer', 1, 'pages/base_widget/AlphabetIndexerPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Blank', 2, 'pages/base_widget/BlankPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Button', 3, 'pages/base_widget/ButtonPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Checkbox', 2, 'pages/base_widget/CheckboxPage')
      );
      this.widgetsArr.push(
        new WidgetBean('CheckboxGroup', 2, 'pages/base_widget/CheckboxGroupPage')
      );
      this.widgetsArr.push(
        new WidgetBean('DataPanel', 1, 'pages/base_widget/DataPanelPage')
      );
      this.widgetsArr.push(
        new WidgetBean('DatePicker', 1, 'pages/base_widget/DatePickerPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Divider', 4, 'pages/base_widget/DividerPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Gauge', 3, 'pages/base_widget/GaugePage')
      );
      this.widgetsArr.push(
        new WidgetBean('Image', 5, 'pages/base_widget/ImagePage')
      );
      this.widgetsArr.push(
        new WidgetBean('ImageAnimator', 2, 'pages/base_widget/ImageAnimatorPage')
      );
      this.widgetsArr.push(
        new WidgetBean('LoadingProgress', 3, 'pages/base_widget/LoadingProgressPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Marquee', 1, 'pages/base_widget/MarqueePage')
      );
      this.widgetsArr.push(
        new WidgetBean('Menu/MenuItem/MenuItemGroup', 3, 'pages/base_widget/MenuAllPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Navigation(未完结)', 4, 'pages/base_widget/NavigationPage')
      );
      this.widgetsArr.push(
        new WidgetBean('PatternLock', 1, 'pages/base_widget/PatternLockPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Progress', 4, 'pages/base_widget/ProgressPage')
      );
      this.widgetsArr.push(
        new WidgetBean('QRCode', 4, 'pages/base_widget/QRCodePage')
      );
      this.widgetsArr.push(
        new WidgetBean('Radio', 4, 'pages/base_widget/RadioPage')
      );
    }, 2000)

  }

  build() {
    Column() {
      if (this.widgetsArr.length == 0) {
        BaseWidgetsLoading()
      } else {
        ForEach(this.widgetsArr, (item: WidgetBean, index: number) => {
          BaseWidgetsItem({ item: item })
        }, (item: WidgetBean, index: number) => {
          return item.pageUrl;
        })
      }
    }
    .backgroundColor(UColors.common_bg)
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}

@Preview
@Component
struct BaseWidgetsItem {
  private item: WidgetBean = {
    key: 'aa',
    leave: 0,
    pageUrl: 'bb'
  };

  build() {
    Column() {
      Text(this.item.key)
        .fontSize(USizes.fp14)
        .fontColor(UColors.text_color3)
        .fontWeight(FontWeight.Bold)
      Rating({ rating: this.item.leave })
        .stars(5)
        .height(USizes.vp20)
    }
    .width(USizes.match_parent)
    .constraintSize({ minHeight: USizes.vp50 })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: USizes.vp16, top: USizes.vp8, right: USizes.vp16, bottom: USizes.vp8 })
    .stateStyles({
      normal: {
        .backgroundColor(UColors.common_bg)
      },
      pressed: {
        .backgroundColor(UColors.text_color9)
      }
    })
    .border({
      width: { left: 0, top: 0, right: 0, bottom: 1 },
      color: UColors.text_color9,
      style: { bottom: BorderStyle.Solid }
    })
    .onClick(() => {
      router.pushUrl({ url: this.item.pageUrl })
    })
  }
}

@Component
struct BaseWidgetsLoading {
  build() {
    Stack({ alignContent: Alignment.Center }) {
      LoadingProgress()
        .width(USizes.vp40)
        .height(USizes.vp40)
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
  }
}

class WidgetBean {
  key: string;
  pageUrl: string;
  leave: number;

  constructor(key: string, leave: number, pageUrl: string) {
    this.key = key;
    this.pageUrl = pageUrl;
    this.leave = leave;
  }
}

