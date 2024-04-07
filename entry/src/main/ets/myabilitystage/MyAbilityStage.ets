import { Net } from '@app/net/src/main/ets/utils/Net';
import AbilityStage from '@ohos.app.ability.AbilityStage'
import { MyNetHeaderInterceptor } from '../pages/wan/http/MyNetHeaderInterceptor';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    Net.getInstance().init({
      baseUrl: "https://www.wanandroid.com", //一般标记为统一的请求前缀，也就是域名
      connectTimeout: 10000, //连接超时，默认10秒
      readTimeout: 10000, //读取超时，默认10秒
      netErrorInterceptor: null, //全局错误拦截器，需继承INetErrorInterceptor
      netHeaderInterceptor: new MyNetHeaderInterceptor(), //全局请求头拦截器，需继承INetHeaderInterceptor
      header: {}, //全局统一的公共头参数
      resultTag: []//接口返回数据参数，比如data,items等等
    })
  }

  onAcceptWant(want) {
    return 'MyAbilityStage';
  }
}