import USizes from '../wan/utils/USizes'

@Entry
@Component
struct GridItemPage {
  @State message: string = 'Hello World'

  build() {
    Column() {

    }
    .height(USizes.match_parent)
    .width(USizes.match_parent)
  }
}