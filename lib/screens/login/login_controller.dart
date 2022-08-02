import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSharedPreferencedLogin();
  }

  Future<void> alterLogin() async {
    isLogin.value = !isLogin.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", isLogin.value);
    update();
  }

  Future<void> getSharedPreferencedLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin.value = prefs.getBool("isLogin") ?? false;
    update();
  }

  Future<void> setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", value);
    isLogin.value = value;
    update();
  }
}
