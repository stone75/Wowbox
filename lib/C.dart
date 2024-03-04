import 'package:wowbox/models/mdlUserInfo.dart';

class C {
  static const String URL_SERVER = "http://api.dev.wowbox.odinox.com/v1";
  static const String URL_REGUSERINFO = "${URL_SERVER}/regUserInfo.php";

  static ModelUserInfo? g_UserInfo = null;

  static void logger(String msg) {
    print(">>>>>> wowbox : ${msg}");
  }
}