@Entry
@Component
struct StateManager2 {
  private mScroller: Scroller = new Scroller();
  @State mNum: number = 10
  @State mBool: boolean = true
  @State mStr: string = Date.now().toString()
  @State clazzA: ClazzA = new ClazzA('clazzA')
  @State moduleA: ModuleA = new ModuleA('moduleA', new ClazzA('moduleA'));
  @State clazzAArray: ClazzA[] = [new ClazzA('1'), new ClazzA('2')]

  @Builder
  MDivider() {
    Divider().margin({ top: '10vp', bottom: '10' })
  }

  build() {
    Column() {

      Text('@State装饰器：组件内状态')
        .width('100%')
        .height('50vp')
        .textAlign(TextAlign.Center)

      Scroll(this.mScroller) {
        Column() {
          Text('当装饰的数据类型为boolean、string、number类型时，可以观察到数值的变化')
          Text(this.mNum.toString())
          Button(`mNum${this.mNum}`).onClick(() => {
            this.mNum += 1;
          })

          Text(this.mBool.toString())
          Button(`mBool${this.mBool}`).onClick(() => {
            this.mBool = !this.mBool;
          })

          Text(this.mStr)
          Button(`时间${this.mStr}`).onClick(() => {
            this.mStr = ""
            this.mStr = this.mStr + Date.now()
          })

          this.MDivider()

          Text(`当装饰的数据类型为class或者Object时，可以观察到自身的赋值的变化，和其属性赋值的变化，即Object.keys(observedObject)返回的所有属性。`)
          Text(this.clazzA.valueA)
          Button('修改clazzA-》valueA').onClick(() => {
            this.clazzA = new ClazzA(`<修改过>${Date.now()}`);
          })
          Text(this.moduleA.valueB)
          Button(`修改moduleA-》valueB`).onClick(() => {
            this.moduleA.valueB = `<修改过>${Date.now()}`
          })
          Text(this.moduleA.clazzA.valueA)
          Button(`修改moduleA-》clazzA`).onClick(() => {
            this.moduleA.clazzA = new ClazzA(`<修改过>${Date.now()}`)
          })
          Text(this.moduleA.clazzA.valueA)
          Button(`修改moduleA-》clazzA-》valueA (观察不到)`).onClick(() => {
            this.moduleA.clazzA.valueA = `<修改过>${Date.now()}`
          })

          this.MDivider()

          Text(`当装饰的对象是array时，可以观察到数组本身的赋值和添加、删除、更新数组的变化。例子如下。`)
          Text(this.currentClazzAArrayValue())
          Button('数组自身的赋值').onClick(() => {
            this.clazzAArray = [new ClazzA(`数组自身的赋值${Date.now()}`)];
          })
          Button('数组项的赋值').onClick(() => {
            this.clazzAArray[0] = new ClazzA(`数组项的赋值${Date.now()}`);
          })
          Button('新增数组项').onClick(() => {
            this.clazzAArray.push(new ClazzA(`新增数组项${Date.now()}`));
          })
          Button('删除数组项').onClick(() => {
            this.clazzAArray.pop();
          })
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  private currentClazzAArrayValue(): string {
    var st: string = '';
    this.clazzAArray.forEach((v, index) => {
      st += `o:${v.valueA}`;
    })
    return st;
  }
}


class ClazzA {
  public valueA: string;

  constructor(valueA: string) {
    this.valueA = valueA;
  }
}

class ModuleA {
  public valueB: string;
  public clazzA: ClazzA;

  constructor(valueB: string, clazzA: ClazzA) {
    this.valueB = valueB;
    this.clazzA = clazzA;
  }
}