@Entry
@Component
struct StateManager1 {
  private mScroller: Scroller = new Scroller();

  build() {
    Column() {
      Text('状态管理概述')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)

      Scroll(this.mScroller) {
        Column() {
          Demo1Parent()
        }
      }
      .width('100%')
    }
  }
}

@Component
struct Demo1Parent {
  @State count: number = 0;

  build() {
    Column() {
      Text(this.count.toString())
      Button('ParentCount').onClick(() => {
        this.count += 1;
      })
      Demo2Child({ count: this.count, increaseBy: 10 })
    }
    .width('100%')
  }
}

@Component
struct Demo2Child {
  @State count: number = 0;
  private increaseBy: number = 1;

  build() {
    Column() {
      Text(this.count.toString())
      Text(this.increaseBy.toString())
      Button('ChildCount').onClick(() => {
        this.count += 1;
      })
    }
    .width('100%')
  }
}