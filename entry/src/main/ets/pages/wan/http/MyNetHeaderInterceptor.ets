import { NetHeaderInterceptor } from '@app/net/src/main/ets/interceptor/NetHeaderInterceptor';
import { HttpHeaderOptions } from '@app/net/src/main/ets/model/HttpHeaderOptions';

/*
* a:byc
* time:2024/4/2
* des:
*/

export class MyNetHeaderInterceptor extends NetHeaderInterceptor {
  getHeader(options: HttpHeaderOptions): Promise<Object> {
    options.header = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    return new Promise<HttpHeaderOptions>((resolve, reject) => {
      resolve(options)
    });
  }
}