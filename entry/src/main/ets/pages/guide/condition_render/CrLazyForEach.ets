import { Size } from '@ohos/hypium';

@Component
struct CrLazyForEach {
  private lazyFe: string[] = [
    '首次渲染1',
    '首次渲染2',
    '首次渲染3',
    '首次渲染4',
    '首次渲染5',
    '首次渲染6',
    '首次渲染7',
    '首次渲染8',
    '首次渲染9',
    '首次渲染10',
    '首次渲染11',
    '首次渲染12',
    '首次渲染13',
    '首次渲染14',
    '首次渲染15',
    '首次渲染16',
    '首次渲染17',
    '首次渲染18',
    '首次渲染19',
    '首次渲染20'
  ];
  private mDs: CrLazyForEachData1 = new CrLazyForEachData1();

  aboutToAppear() {
    this.lazyFe.forEach(v => {
      this.mDs.add(v);
    })
  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Text('增加')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .height('100%')
          .layoutWeight(1)
          .onClick(() => {
            this.mDs.addIndex(0, `首次渲染-增加${new Date().getTime()}`);
          })
        Text('修改')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .height('100%')
          .layoutWeight(1)
          .onClick(() => {
            this.mDs.update(0);
          })
        Text('删除')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .height('100%')
          .layoutWeight(1)
          .onClick(() => {
            this.mDs.delete(1);
          })
      }
      .width('100%')
      .height(50)

      List({ space: 20, initialIndex: 0 }) {
        LazyForEach(this.mDs, (item: string, index: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .onClick(() => {
                console.info(item)
              })
          }
        }, (item: string, index: number) => {
          return item;
        })
      }
      .cachedCount(2)
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 2, color: Color.Black, startMargin: 16, endMargin: 16 }) // 每行之间的分界线
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .width('100%')
      .height('100%')
      .layoutWeight(1)
    }.width('100%')
    .height('100%')
  }
}

class MyBaseDataSource <T> implements IDataSource {
  listeners: Array<DataChangeListener> = [];
  originDataArray: Array<T> = [];

  totalCount(): number {
    return this.originDataArray.length ?? 0;
  }

  getData(index: number): T {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('register listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener) {
    let position = this.listeners.indexOf(listener);
    if (position >= 0) {
      console.info('unregister listener');
      this.listeners.splice(position, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class CrLazyForEachData1 extends MyBaseDataSource<string> {
  public add(d: string) {
    this.originDataArray.push(d);
  }

  public addIndex(index: number, d: string) {
    this.originDataArray.unshift(d);
    this.notifyDataAdd(index);
  }

  public addList(ds: Array<string>) {
    ds.forEach(v => {
      this.originDataArray.push(v);
    })
  }

  public update(index: number) {
    this.originDataArray[index] = `更新--》${new Date().getTime()}`
    this.notifyDataChange(index);
  }

  public delete(index: number) {
    this.originDataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }
}



class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: StringData[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): StringData {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: StringData[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): StringData {
    return this.dataArray[index];
  }

  public originArr():Array<StringData>{
    return this.dataArray;
  }

  public addData(index: number, data: StringData): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: StringData): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Observed
class StringData {
  message: NestedString;
  constructor(message: NestedString) {
    this.message = message;
  }
}

@Observed
class NestedString {
  message: string;
  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@Component
struct MyComponent {
  private moved: number[] = [];
  @State data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(new StringData(new NestedString(`Hello ${i}`)));
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: StringData, index: number) => {
        ListItem() {
          ChildComponent({data: this.data.originArr()[index}.data)
        }
        .onClick(() => {
          item.message.message += '0';
        })
      }, (item: StringData, index: number) => JSON.stringify(item) + index.toString())
    }.cachedCount(5)
  }
}

@Component
struct ChildComponent {
  @ObjectLink data:NestedString
  build() {
    Row() {
      Text(this.data.message).fontSize(50)
        .onAppear(() => {
          console.info("appear:" + this.data.message)
        })
    }.margin({ left: 10, right: 10 })
  }
}