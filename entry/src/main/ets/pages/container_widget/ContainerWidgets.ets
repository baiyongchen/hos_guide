import router from '@ohos.router'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct ContainerWidgets {
  @State widgetsArr: WidgetBean[] = []

  onPageShow() {

    setInterval(() => {
      this.widgetsArr.push(
        new WidgetBean('Badge', 3, 'pages/container_widget/BadgePage')
      );
      this.widgetsArr.push(
        new WidgetBean('Column', 5, 'pages/container_widget/ColumnPage')
      );
      this.widgetsArr.push(
        new WidgetBean('ColumnSplit', 0, 'pages/container_widget/ColumnSplitPage')
      );
      this.widgetsArr.push(
        new WidgetBean('CounterSplit', 3, 'pages/container_widget/CounterPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Flex', 5, 'pages/container_widget/FlexPage')
      );
      this.widgetsArr.push(
        new WidgetBean('WaterFlow/FlowItem', 5, 'pages/container_widget/WaterFlowFlowItemPage')
      );
      this.widgetsArr.push(
        new WidgetBean('GridRow/GridCol', 3, 'pages/container_widget/GridRow_GridColPage')
      );
      this.widgetsArr.push(
        new WidgetBean('Grid', 5, 'pages/container_widget/GridPage')
      );
      this.widgetsArr.push(
        new WidgetBean('GridItem', 5, 'pages/container_widget/GridItemPage')
      );
    }, 2000)

  }

  build() {
    Column() {
      if (this.widgetsArr.length == 0) {
        BaseWidgetsLoading()
      } else {
        List() {
          ForEach(this.widgetsArr, (item: WidgetBean, index: number) => {
            ListItem() {
              BaseWidgetsItem({ item: item })
            }
          }, (item: WidgetBean, index: number) => {
            return item.pageUrl;
          })
        }
        .width(USizes.match_parent)
        .height(USizes.match_parent)
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
