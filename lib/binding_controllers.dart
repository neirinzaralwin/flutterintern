import 'package:dayone/controllers/access_token_controller.dart';
import 'package:dayone/screens/login/login_controller.dart';
import 'package:dayone/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<AccessTokenController>(AccessTokenController());
    Get.put<ProfileController>(ProfileController());
    Get.put<LoginController>(LoginController());
  }
}
