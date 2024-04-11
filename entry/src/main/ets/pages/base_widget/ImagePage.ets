import { T_14_3_b_h16_v10 } from '../common/TextBuilder';
import USizes from '../wan/utils/USizes'
import image from '@ohos.multimedia.image';
import { reqPermissionsFromUser } from '../../permissions/PremissionsUtils';
import UColors from '../wan/utils/UColors';
import { tagMsg } from '../wan/utils/Logger';

@Entry
@Component
struct ImagePage {
  private mSc: Scroller = new Scroller();
  private mSc2: Scroller = new Scroller();
  private pm: image.PixelMap;
  @State netStatus: boolean = false;
  private netImageUrl = 'https://ts1.cn.mm.bing.net/th/id/R-C.80ba046f8bb6e6df41a88bb3956441c5?rik=so9s3w2Xzo9euQ&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f7e%2f2b%2f820b-ec18-45b3-a176-e12c1cdd5cb966%2fimageView%2fv1%2fthumbnail%2f640x0&ehk=UXt3yu%2f1VP5lEJ5jWGl91oNfNCNvoiHxUjwCAhxotYw%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1';
  @State imageLoadResult: boolean = true;

  async aboutToAppear() {

    this.netStatus = await reqPermissionsFromUser('ohos.permission.INTERNET')

    if (this.netStatus) {
      this.pm = await image.createImageSource('https://ts1.cn.mm.bing.net/th/id/R-C.80ba046f8bb6e6df41a88bb3956441c5?rik=so9s3w2Xzo9euQ&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f7e%2f2b%2f820b-ec18-45b3-a176-e12c1cdd5cb966%2fimageView%2fv1%2fthumbnail%2f640x0&ehk=UXt3yu%2f1VP5lEJ5jWGl91oNfNCNvoiHxUjwCAhxotYw%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')
        .createPixelMap({
          sampleSize: 1,
          editable: true,
          desiredSize: { width: 1, height: 2 },
          rotate: 10,
          desiredPixelFormat: 3,
          desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
          index: 0
        })
    }


  }

  async build() {
    Column() {
      Scroll(this.mSc) {
        Column() {

          T_14_3_b_h16_v10('12、属性autoResizer')
          Image(this.imageLoadResult ? "aaaa" : $r('app.media.icon_image_error'))
            .alt($r('app.media.icon_image_alt'))
            .width(USizes.vp200)
            .height(USizes.vp100)
            .objectFit(ImageFit.Contain)
            .onComplete((event) => {
              console.debug(tagMsg(event.height.toString()));
            })
            .onError((e) => {
              this.imageLoadResult = false;
            })
          T_14_3_b_h16_v10('11、属性fillColor')
          Image($rawfile('icon_test_image1.svg'))
            .width(USizes.vp200)
            .height(USizes.vp100)
            .objectFit(ImageFit.ScaleDown)
            .fillColor(Color.Green)
            .backgroundColor(UColors.text_color9)
          T_14_3_b_h16_v10('10、属性fitOriginalSize')
          Image(this.netImageUrl)
            .width(USizes.vp200)
            .height(USizes.vp100)
            .fitOriginalSize(false)

          T_14_3_b_h16_v10('9、属性sourceSize')
          Image(this.netImageUrl)
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Contain)
            .sourceSize({ width: fp2px(20), height: fp2px(20) })
          T_14_3_b_h16_v10('8.2、ImageRenderMode.Template')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Contain)
            .renderMode(ImageRenderMode.Template)
          T_14_3_b_h16_v10('8.1、ImageRenderMode.Original')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Fill)
            .renderMode(ImageRenderMode.Original)
          T_14_3_b_h16_v10('7.4、ImageInterpolation.High')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Fill)
            .interpolation(ImageInterpolation.High)
          T_14_3_b_h16_v10('7.3、ImageInterpolation.Medium')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Fill)
            .interpolation(ImageInterpolation.Medium)
          T_14_3_b_h16_v10('7.2、ImageInterpolation.Low')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Fill)
            .interpolation(ImageInterpolation.Low)
          T_14_3_b_h16_v10('7.1、ImageInterpolation.None')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.Fill)
            .interpolation(ImageInterpolation.None)
          T_14_3_b_h16_v10('6.4、ImageRepeat.NoRepeat')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.None)
            .objectRepeat(ImageRepeat.NoRepeat)
          T_14_3_b_h16_v10('6.3、ImageRepeat.XY')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.None)
            .objectRepeat(ImageRepeat.XY)
          T_14_3_b_h16_v10('6.2、ImageRepeat.Y')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.None)
            .objectRepeat(ImageRepeat.Y)
          T_14_3_b_h16_v10('6.1、ImageRepeat.X')
          Image($r('app.media.app_icon'))
            .width(USizes.vp100)
            .height(USizes.vp50)
            .objectFit(ImageFit.None)
            .objectRepeat(ImageRepeat.X)
          T_14_3_b_h16_v10('5.6、ImageFit.None')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.None)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('5.5、ImageFit.ScaleDown')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.ScaleDown)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('5.4、ImageFit.Fill')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.Fill)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('5.3、ImageFit.Auto')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.Auto)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('5.2、ImageFit.Cover')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.Cover)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('5.1、ImageFit.Contain')
          Image($r('app.media.app_icon'))
            .objectFit(ImageFit.Contain)
            .width(USizes.vp100)
            .height(USizes.vp50)
          T_14_3_b_h16_v10('4、属性alt')
          Image(this.netImageUrl)
            .alt($r('app.media.icon_image_alt'))
            .width(USizes.vp200)
            .height(USizes.vp100)
            .borderRadius(50)
          T_14_3_b_h16_v10('3、参数Resource')
          Image($r('app.media.startIcon'))
            .width(USizes.vp100)
            .height(USizes.vp100)
          T_14_3_b_h16_v10('2、参数PixelMap')
          Image(this.pm)
          T_14_3_b_h16_v10('1、参数string')
          Image(this.netImageUrl)
            .width('200vp')
            .height('100vp')
        }
      }
      .scrollBar(BarState.Off)
    }
    .width(USizes.match_parent)
    .height(USizes.match_parent)
    .backgroundColor(UColors.white)
  }
}