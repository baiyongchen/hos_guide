import router from '@ohos.router'
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
        new WidgetBean('AlphabetIndexer', 'pages/base_widget/AlphabetIndexerPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Blank', 'pages/base_widget/BlankPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Button', 'pages/base_widget/ButtonPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Checkbox', 'pages/base_widget/CheckboxPage')
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
    pageUrl: 'bb'
  };

  build() {
    Column() {
      Text(this.item.key)
        .fontSize(USizes.fp14)
        .fontColor(UColors.text_color3)
        .fontWeight(FontWeight.Bold)
    }
    .width(USizes.match_parent)
    .height(USizes.vp50)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: USizes.vp16, right: USizes.vp16 })
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

  constructor(key: string, pageUrl: string) {
    this.key = key;
    this.pageUrl = pageUrl;
  }
}

