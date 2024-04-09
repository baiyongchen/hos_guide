import UColors from '../wan/utils/UColors';
import USizes from '../wan/utils/USizes'

@Entry
@Component
struct CheckboxGroupPage {
  @State dataArr: Array<ParentBean> = [];
  @State childArr: Array<ChildBean> = [];

  /* onPageShow() {
     dataJson.forEach((vP, index) => {
       let tempChileArr: Array<ChildBean> = [];
       vP.children.forEach((vC, index) => {
         tempChileArr.push(new ChildBean(vC.catalog, vC.depth, vC.id))
       })
       this.dataArr.push(new ParentBean(vP.catalog, tempChileArr, vP.depth, vP.id))
     })
   }*/

  /*build() {
    List() {
      ForEach(this.dataArr, (itemP: ParentBean, indexP: number) => {
        ListItem() {
          Column() {
            Row() {
              CheckboxGroup({ group: `${itemP.id}:${itemP.catalog}:${itemP.depth}` })
              Text(itemP.catalog)
                .fontColor(UColors.text_color3)
                .fontSize(USizes.vp14)
            }
            .padding({ left: USizes.vp16, right: USizes.vp16 })

            List() {
              ForEach(itemP.children, (itemC: ChildBean, indexC: number) => {
                ListItem() {
                  Row() {
                    Checkbox({ group: `${itemP.id}:${itemP.catalog}:${itemP.depth}` })
                    Text(itemC.catalog)
                      .fontColor(UColors.text_color6)
                      .fontSize(USizes.vp14)
                  }
                  .padding({ left: '36vp', right: USizes.vp16 })
                }
              }, (itemC: ChildBean, indexC: number) => {
                return `${itemC.id}:${itemC.catalog}:${itemC.depth}`;
              })
            }
            .divider({ strokeWidth: USizes.vp12 })
          }
          .alignItems(HorizontalAlign.Start)
        }
      }, (itemP: ParentBean, indexP: number) => {
        return `${itemP.id}:${itemP.catalog}:${itemP.depth}`;
      })
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .divider({ strokeWidth: USizes.vp12 })
  }*/

  onPageShow() {
    dataJson.forEach((vP, index) => {
      this.childArr.push(new ChildBean(vP.catalog, vP.depth, vP.id, vP.id))
      vP.children.forEach((vC, index) => {
        this.childArr.push(new ChildBean(vC.catalog, vC.depth, vC.id, vC.fatherid))
      })
    })
  }

  build() {
    List() {
      ForEach(this.childArr, (item: ChildBean, index: number) => {
        if (item.id === item.fatherid) {
          ListItem() {
            Row() {
              CheckboxGroup({ group: `${item.fatherid}` })
                .selectAll(true)
                .selectedColor(UColors.theme_color)
                .onChange((event) => {
                  console.debug(tagMsg(event.status.toString()))
                })
              Text(item.catalog)
                .fontColor(UColors.text_color3)
                .fontSize(USizes.vp14)
            }
            .padding({ left: USizes.vp16, right: USizes.vp16 })
          }
        } else {
          ListItem() {
            Row() {
              Checkbox({ name: item.catalog, group: `${item.fatherid}` })
                .selectedColor(UColors.theme_color)
              Text(item.catalog)
                .fontColor(UColors.text_color6)
                .fontSize(USizes.vp14)
            }
            .padding({ left: '36vp', right: USizes.vp16 })
          }
        }
      }, (item: ChildBean, index: number) => {
        return `${item.depth}:${item.id}:${item.catalog}`;
      })
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .divider({ strokeWidth: USizes.vp12 })
  }
}

class ParentBean {
  catalog: string;
  children: ChildBean[];
  depth: number;
  id: number;

  constructor(catalog: string, children: ChildBean[], depth: number, id: number) {
    this.catalog = catalog;
    this.children = children;
    this.depth = depth;
    this.id = id;
  }
}

class ChildBean {
  catalog: string;
  depth: number;
  id: number;
  fatherid: number;

  constructor(catalog: string, depth: number, id: number, fatherid: number) {
    this.catalog = catalog;
    this.depth = depth;
    this.id = id;
    this.fatherid = fatherid;
  }
}

function tagMsg(msg: string): string {
  return `baiyongchen->${msg}`;
}

let dataJson = [
  {
    "catalog": "公安(司法)类(不需面试)",
    "children": [
      {
        "catalog": "公安(司法)类(不区分男女)",
        "depth": 3,
        "fatherid": 4,
        "id": 16
      },
      {
        "catalog": "公安(司法)类(女生)",
        "depth": 3,
        "fatherid": 4,
        "id": 17
      },
      {
        "catalog": "公安(司法)类(男生)",
        "depth": 3,
        "fatherid": 4,
        "id": 18
      }
    ],
    "depth": 2,
    "fatherid": 2,
    "id": 4
  },
  {
    "catalog": "公安(司法)类(需面试)",
    "children": [
      {
        "catalog": "公安(司法)类(男生)",
        "depth": 3,
        "fatherid": 5,
        "id": 19
      },
      {
        "catalog": "公安(司法)类(女生)",
        "depth": 3,
        "fatherid": 5,
        "id": 20
      }
    ],
    "depth": 2,
    "fatherid": 2,
    "id": 5
  },
  {
    "catalog": "其他院校(专业)",
    "children": [
      {
        "catalog": "其他类(需面试)",
        "depth": 3,
        "fatherid": 6,
        "id": 21
      },
      {
        "catalog": "其他类(不需面试或签约)",
        "depth": 3,
        "fatherid": 6,
        "id": 22
      },
      {
        "catalog": "其他类(需签约)",
        "depth": 3,
        "fatherid": 6,
        "id": 23
      }
    ],
    "depth": 2,
    "fatherid": 2,
    "id": 6
  },
  {
    "catalog": "非军事院校",
    "children": [
      {
        "catalog": "其他院校(专业)",
        "depth": 3,
        "fatherid": 15,
        "id": 26
      },
      {
        "catalog": "国家优师专项",
        "depth": 3,
        "fatherid": 15,
        "id": 27
      },
      {
        "catalog": "国家公费师范生",
        "depth": 3,
        "fatherid": 15,
        "id": 28
      },
      {
        "catalog": "国家公费师范生(国家专项计划)",
        "depth": 3,
        "fatherid": 15,
        "id": 29
      },
      {
        "catalog": "省内公费师范生(含优师专项)",
        "depth": 3,
        "fatherid": 15,
        "id": 30
      }
    ],
    "depth": 2,
    "fatherid": 3,
    "id": 15
  }
]