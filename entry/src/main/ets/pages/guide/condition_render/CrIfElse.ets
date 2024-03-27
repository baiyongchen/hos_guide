@Entry
@Component
struct CrIfElse {
  private mSc: Scroller = new Scroller();

  build() {
    Column() {
      Text('if/else：条件渲染')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)
      Scroll(this.mSc) {
        Column() {
          Text('使用if进行条件渲染')
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })

          ViewA()

          Divider().padding({ top: '10vp', bottom: '10vp' })

          Text('if ... else ...语句和子组件状态')
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })
          Text('if ... else ...条件切换导致控件是删除老的创建新的，不是隐藏显示。')
            .textAlign(TextAlign.Start)
            .fontSize('12fp')
            .fontColor(Color.Red)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })
          ViewB()

          Divider().padding({ top: '10vp', bottom: '10vp' })

          Text('if ... else ...语句和子组件状态')
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })
          Text('if ... else ...条件切换保持字控件值方式，提升到父类维护。')
            .textAlign(TextAlign.Start)
            .fontSize('12fp')
            .fontColor(Color.Red)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })

          ViewC()

          Divider().padding({ top: '10vp', bottom: '10vp' })

          Text('嵌套if语句')
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: '16vp', right: '16vp' })


          CompA()

        }
      }
      .layoutWeight(1)
      .layoutWeight(1)
      .scrollable(ScrollDirection.Vertical)
      .align(Alignment.TopStart)

    }
    .width('100%')
  }
}

@Component
struct CompA {
  @State toggle: boolean = false;
  @State toggleColor: boolean = false;

  build() {
    Column() {
      Text('Before')
        .fontSize(15)
      if (this.toggle) {
        Text('Top True, positive 1 top')
          .backgroundColor('#aaffaa').fontSize(20)
        // 内部if语句
        if (this.toggleColor) {
          Text('Top True, Nested True, positive COLOR  Nested ')
            .backgroundColor('#00aaaa').fontSize(15)
        } else {
          Text('Top True, Nested False, Negative COLOR  Nested ')
            .backgroundColor('#aaaaff').fontSize(15)
        }
      } else {
        Text('Top false, negative top level').fontSize(20)
          .backgroundColor('#ffaaaa')
        if (this.toggleColor) {
          Text('positive COLOR  Nested ')
            .backgroundColor('#00aaaa').fontSize(15)
        } else {
          Text('Negative COLOR  Nested ')
            .backgroundColor('#aaaaff').fontSize(15)
        }
      }
      Text('After')
        .fontSize(15)
      Button('Toggle Outer')
        .onClick(() => {
          this.toggle = !this.toggle;
        })
      Button('Toggle Inner')
        .onClick(() => {
          this.toggleColor = !this.toggleColor;
        })
    }
  }
}


@Component
struct ViewC1 {
  @Link childNum: number;

  build() {
    Text(`控件1--》值：${this.childNum}`)
      .onClick(() => {
        this.childNum += 1;
      })
  }
}

@Component
struct ViewC2 {
  @Link childNum: number;

  build() {
    Text(`控件2--》值：${this.childNum}`)
      .onClick(() => {
        this.childNum += 1;
      })
  }
}

@Component
struct ViewC {
  @State switchWidget: boolean = false;
  @State childNum: number = 0;

  build() {
    Column() {
      if (this.switchWidget) {
        ViewC1({ childNum: this.childNum })
      } else {
        ViewC2({ childNum: this.childNum })
      }
      Button(`当前显示控件${this.switchWidget ? '1' : '2'}`).onClick(() => {
        this.switchWidget = !this.switchWidget
      })
    }
  }
}

@Component
struct ViewB1 {
  @State childNum: number = 0;

  build() {
    Text(`控件1--》值：${this.childNum}`)
      .onClick(() => {
        this.childNum += 1;
      })
  }
}

@Component
struct ViewB2 {
  @State childNum: number = 0;

  build() {
    Text(`控件2--》值：${this.childNum}`)
      .onClick(() => {
        this.childNum += 1;
      })
  }
}

@Component
struct ViewB {
  @State switchWidget: boolean = false;

  build() {
    Column() {
      if (this.switchWidget) {
        ViewB1()
      } else {
        ViewB2()
      }
      Button(`当前显示控件${this.switchWidget ? '1' : '2'}`).onClick(() => {
        this.switchWidget = !this.switchWidget
      })
    }
  }
}

@Component
struct ViewA {
  @State currentCount: number = 0;

  build() {
    Column() {
      Text(`当前值:${this.currentCount}`)
      if (this.currentCount > 0) {
        Text('条件控件')
      }

      Button('+1').onClick(() => {
        this.currentCount += 1;
      })
      Button('-1').onClick(() => {
        this.currentCount -= 1;
      })
    }
  }
}