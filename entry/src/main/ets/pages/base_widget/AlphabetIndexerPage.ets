import ArrayList from '@ohos.util.ArrayList'
import UColors from '../wan/utils/UColors'
import USizes from '../wan/utils/USizes'
import CityObject from './DataVm'

@Entry
@Component
struct AlphabetIndexerPage {
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z']
  @State values: Array<string> = ['#'];
  @State cityLetterList: Array<CityLetter> = [];
  @State aiSelect: number = 1;
  private listScroller: Scroller = new Scroller();

  aboutToAppear(){

  }

  onPageShow() {
    var tempCityObject = CityObject['city'];
    tempCityObject.forEach((v, index) => {
      var cityss: Array<City> = new Array();
      v.lists.forEach((v1, index1) => {
        cityss.push(new City(v1.city, v1.code, v1.pinyin));
      })
      this.values.push(v.title);
      this.cityLetterList.push(new CityLetter(v.title, cityss));
    })
  }

  @Builder
  cityLetter(letter: string) {
    Text(letter)
      .fontSize(USizes.fp16)
      .fontWeight(FontWeight.Bold)
      .fontColor(UColors.text_color3)
      .padding({ left: USizes.vp16, right: USizes.vp16 })
      .width(USizes.match_parent)
      .height(USizes.vp40)
      .backgroundColor(UColors.theme_color)
  }

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row() {
        Stack({ alignContent: Alignment.Start }) {
          List({ space: 0, initialIndex: 0, scroller: this.listScroller }) {
            ForEach(this.cityLetterList, (itemGroup: CityLetter, indexGroup: number) => {
              ListItemGroup({ header: this.cityLetter(itemGroup.title) }) {
                ForEach(itemGroup.lists, (item: City, index: number) => {
                  ListItem() {
                    Text(item.city)
                      .fontColor(UColors.text_color6)
                      .fontSize(USizes.fp16)
                      .width(USizes.match_parent)
                      .padding(USizes.vp16)
                  }
                }, (item: City, index: number) => {
                  return JSON.stringify(item);
                })
              }
              .divider({
                strokeWidth: USizes.vp1,
                color: UColors.cf4f5f6,
                startMargin: USizes.vp16,
                endMargin: USizes.vp16
              })
            }, (itemGroup: CityLetter, indexGroup: number) => {
              return itemGroup.title;
            })
          }
          .height('100%')
          .width('100%')
          .backgroundColor(UColors.white)
          .sticky(StickyStyle.Header)
          .divider({ strokeWidth: 0 })
          .onScrollIndex((s, e) => {
            this.aiSelect = s + 1;
            //this.aiSelect = e + 1;
            //console.debug(`baiyongchen->${s}-${e}`);
          })
        }.height('100%').layoutWeight(1)

        AlphabetIndexer({ arrayValue: this.values, selected: this.aiSelect })
          .selectedColor(0xFFFFFF)// 选中项文本颜色
          .selectedBackgroundColor(UColors.theme_color)// 选中项背景颜色
          .selectedFont({ size: 16, weight: FontWeight.Bolder })// 选中项字体样式
          .itemSize(28)// 每一项的尺寸大小
          .onSelect((index: number) => {
            this.listScroller.scrollToIndex(index - 1);
            console.debug(`baiyongchen->${index}`)
          })
          .backgroundColor(UColors.white)
      }
      .width('100%')
      .height('100%')
    }
  }
}

class CityLetter {
  title: string;
  lists: City[];

  constructor(title: string, lists: City[]) {
    this.title = title;
    this.lists = lists;
  }
}

class City {
  city: string;
  code: string;
  pinyin: string;

  constructor(city: string, code: string, pinyin: string) {
    this.city = city;
    this.code = code;
    this.pinyin = pinyin;
  }
}



