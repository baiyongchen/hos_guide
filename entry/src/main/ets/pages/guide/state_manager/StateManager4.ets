@Entry
@Component
struct StateManager4 {
  private mS: Scroller = new Scroller();
  @State mButtonState: ButtonState = new ButtonState(200);
  @State mButtonW: number = 200;
  @State arrNum: number[] = [1, 2, 3];

  build() {
    Column() {
      Text('@Link装饰器：父子双向同步')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)

      Scroll(this.mS) {
        Column() {
          Text('简单类型和类对象类型的@Link')

          Button('父类类赋值')
            .width(this.mButtonState.mWidth)
            .height(50)
            .onClick(() => {
              if (this.mButtonState.mWidth < 300) {
                this.mButtonState.mWidth += 50
              } else {
                this.mButtonState = new ButtonState(200);
              }
            })
          Button('父类属性赋值')
            .width(this.mButtonW)
            .height(50)
            .onClick(() => {
              if (this.mButtonW < 300) {
                this.mButtonW += 50
              } else {
                this.mButtonW = 200;
              }
            })
          GButton({ mButtonState: this.mButtonState })
          YButton({ mButtonW: this.mButtonW })

          Divider()
            .margin({ top: 20, bottom: 20 })

          Text('数组类型的@Link')

          ArrChild({ arrNum: this.arrNum })

          ForEach(
            this.arrNum,
            (item, index) => {
              Text((item as number).toString())
            },
            (item, index) =>
            (item as number).toString()
          )

        }
      }
      .align(Alignment.TopStart)
      .scrollable(ScrollDirection.Vertical)
      .layoutWeight(1)

    }
    .width('100%')
  }
}


@Component
struct ArrChild {
  @Link arrNum: number[];

  build() {
    Column() {
      Button('push').onClick(() => {
        this.arrNum.push(this.arrNum.length)
      })
      Button('replace').onClick(() => {
        this.arrNum = [100, 200, 300];
      })
    }
  }
}


class ButtonState {
  public mWidth: number = 200;

  constructor(mWidth: number) {
    this.mWidth = mWidth;
  }
}

@Component
struct GButton {
  @Link mButtonState: ButtonState;

  build() {
    Button('类赋值')
      .width(this.mButtonState.mWidth)
      .height(50)
      .backgroundColor(Color.Green)
      .fontColor(Color.Black)
      .onClick(() => {
        if (this.mButtonState.mWidth < 300) {
          this.mButtonState.mWidth += 50
        } else {
          this.mButtonState = new ButtonState(200);
        }
      })
  }
}

@Component
struct YButton {
  @Link mButtonW: number;

  build() {
    Button('属性赋值')
      .width(this.mButtonW)
      .height(50)
      .backgroundColor(Color.Yellow)
      .fontColor(Color.Black)
      .onClick(() => {
        if (this.mButtonW < 300) {
          this.mButtonW += 50;
        } else {
          this.mButtonW = 200;
        }
      })
  }
}

