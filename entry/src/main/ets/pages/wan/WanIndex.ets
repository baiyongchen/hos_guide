import { Net } from '@app/net/src/main/ets/utils/Net'

@Entry
@Component
struct WanIndex {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            Net.get("/article/list/0/json").requestString((data) => {
              console.debug(data)
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}