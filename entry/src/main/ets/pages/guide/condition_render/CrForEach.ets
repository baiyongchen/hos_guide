import router from '@ohos.router';

@Entry
@Component
struct CrForEach {
  private crFeArr: CrFeBean[] = [];

  aboutToAppear() {
    this.crFeArr.push(new CrFeBean('首次渲染键值不同', 'pages/guide/condition_render/CrForEach1'))
    this.crFeArr.push(new CrFeBean('首次渲染键值相同', 'pages/guide/condition_render/CrForEach2'))
    this.crFeArr.push(new CrFeBean('首次渲染2', ''))
  }

  build() {
    Column() {
      Text('ForEach：循环渲染')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)
      List({ space: '10vp' }) {
        ForEach(this.crFeArr, (item: CrFeBean, index: number) => {
          ListItem() {
            Row() {
              Text(item.name)
            }
            .width('100%')
            .height('80vp')
            .backgroundColor('#f0f6f7')
            .justifyContent(FlexAlign.Center)
            .border({ radius: { topLeft: '10vp', topRight: '10vp', bottomLeft: '10vp', bottomRight: '10vp' } })
          }
          .padding({ right: '16vp', left: '16vp' })
          .onClick(() => {
            router.pushUrl({ url: item.path, params: { 'title': item.name } })
          })
        }, (item: CrFeBean, index: number) => {
          return item.name;
        })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
  }
}

class CrFeBean {
  public name: string
  public path: string

  constructor(name: string, path: string) {
    this.name = name
    this.path = path
  }
}