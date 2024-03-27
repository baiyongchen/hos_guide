@Entry
@Component
struct StateManager3 {
  private mScroller: Scroller = new Scroller();
  //@Prop mNum: number = 1;
  @State mPNum: number = 10;

  @Builder
  MDivider() {
    Divider().margin({ top: '10vp', bottom: '10' })
  }

  build() {
    Column() {
      Text('@Prop装饰器：父子单向同步')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)

      Scroll(this.mScroller) {
        Column() {
          Text('@Prop装饰器不能在@Entry装饰的自定义组件中使用。')

          this.MDivider()

          Text(this.mPNum.toString())
          Button('修改父mPNum影响子类').onClick(() => {
            this.mPNum += 1;
          })
          StateManagerChild1({ mNum: this.mPNum })

          this.MDivider()

          Text('父组件@State数组项到子组件@Prop简单数据类型同步')

          StateManagerChild2()

          this.MDivider()

          Text('从父组件中的@State类对象属性到@Prop简单类型的同步')

          StateManagerChild3()

          this.MDivider()
          Text('@Prop本地初始化不和父组件同步')
          StateManagerChild4()


        }
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)

    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct StateManagerChild4 {
  @State mNum: number = 1;

  build() {
    Column() {
      StateManagerChild41({ mNun: this.mNum })
      StateManagerChild41({ mNun: this.mNum, mNum2: this.mNum })
    }
  }
}

@Component
struct StateManagerChild41 {
  @Prop mNun: number;
  @Prop mNum2: number = 10;

  build() {

    Column() {
      Text(this.mNun.toString())
      Button('修改同步数据').onClick(() => {
        this.mNun += 1;
      })

      Text(this.mNum2.toString())
      Button('修改未同步数据').onClick(() => {
        this.mNum2 += 1;
      })
    }
  }
}

@Component
struct StateManagerChild1 {
  @Prop mNum: number = 1

  build() {
    Column() {
      Text('当装饰的类型是允许的类型，即string、number、boolean、enum类型都可以观察到的赋值变化；')
      Text(this.mNum.toString())
      Button('修改mNum不影响父类').onClick(() => {
        this.mNum += 1;
      })
    }
  }
}

@Component
struct StateManagerChild2 {
  @State numArr: number[] = [1, 2, 3]

  build() {
    Column() {
      Text('父组件中@State如果装饰的数组，其数组项也可以初始化@Prop。以下示例中父组件Index中@State装饰的数组arr，将其数组项初始化子组件Child中@Prop装饰的value。')
      StateManagerChild21({ value: this.numArr[0] })
      StateManagerChild21({ value: this.numArr[1] })
      StateManagerChild21({ value: this.numArr[2] })
      Divider().width('100vp')
      ForEach(
        this.numArr,
        (item, index) => {
          StateManagerChild21({ value: item } as Record<string, number>)
        },
        (item, index) => (item as number).toString())
      Text('replace entire arr')
        .onClick(() => {
          // 两个数组都包含项“3”。
          this.numArr = this.numArr[0] == 1 ? [3, 4, 5] : [1, 2, 3];
        })
    }
  }
}

@Component
struct StateManagerChild21 {
  @Prop value: number = 1

  build() {
    Column() {
      Text(this.value.toString())
        .onClick(() => {
          this.value += 1;
        })
    }
  }
}

class Book {
  public title: string = '';
  public readIt: boolean = false;

  constructor(title: string) {
    this.title = title;
  }
}

@Component
struct StateManagerChild3 {
  @State mBook: Book = new Book('java');

  build() {
    Column() {
      StateManagerChild31({ title: this.mBook.title, readIt: this.mBook.readIt })
      StateManagerChild31({ title: this.mBook.title, readIt: this.mBook.readIt })

      Button(`设置全部${this.mBook.readIt ? '未读' : '已读'}`).onClick(() => {
        this.mBook.readIt = !this.mBook.readIt;
      })
    }
  }
}

@Component
struct StateManagerChild31 {
  @Prop title: string = '';
  @Prop readIt: boolean = false;

  build() {
    Row() {
      Text(this.title)
      Text(`...${this.readIt ? '已读' : '未读'}`)
        .onClick(() => {
          this.readIt = !this.readIt;
        })
    }
  }
}