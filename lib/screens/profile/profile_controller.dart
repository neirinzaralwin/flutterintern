import 'dart:convert';

import 'package:dayone/controllers/access_token_controller.dart';
import 'package:dayone/models/profile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxString username = "".obs;
  RxString name = "".obs;
  RxString phone = "".obs;
  RxString email = "".obs;
  RxString duty = "".obs;
  RxString warehouse = "".obs;

  var isLoading = true.obs;

  Future<void> fetchProfileData() async {
    String token = await Get.find<AccessTokenController>().getToken();
    try {
      final response = await http.get(
          Uri.parse('http://test.ntrcarparts.xyz/api/logistic/profile'),
          headers: {
            "Content-Type": "application/json; charset= UTF-8",
            "Authorization": "Bearer $token",
          });

      if (response.statusCode == 200) {
        Profile profile = Profile.fromJson(jsonDecode(response.body));
        username.value = profile.data.username;
        name.value = profile.data.name;
        phone.value = profile.data.phone;
        email.value = profile.data.email ?? "no email";
        duty.value = profile.data.duty;
        warehouse.value = profile.data.warehouse;

        // checking and printing
        print("username : ${username.value} || email: ${email.value}");
        isLoading.value = false;
        update();
      } else {
        Get.snackbar('Can\'t Access',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
        isLoading.value = false;
        update();
      }
    } catch (err) {
      print(" Error message from access Token >>>> ${err.toString()}");
      isLoading.value = false;
      update();
    }
  }
}
