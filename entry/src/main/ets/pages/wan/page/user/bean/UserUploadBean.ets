/*
* a:byc
* time:2024/4/2
* des:
*/

export class RegisterUploadBean {
  private username: string;
  private password: string;
  private repassword: string;

  constructor(username: string, password: string, repassword: string) {
    this.username = username;
    this.password = password;
    this.repassword = repassword;
  }
}