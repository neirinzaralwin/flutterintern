import 'dart:convert';
import 'package:dayone/models/bearer.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccessTokenController extends GetxController {
  RxString token = "".obs;
  var isLoading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   sendRequest();
  // }

  Future<bool> sendRequest(String username, String password) async {
    isLoading.value = true;
    var requestBody = {
      'username': username,
      'password': password,
    };
    try {
      final response = await http.post(
          Uri.parse('http://test.ntrcarparts.xyz/api/delivery/login'),
          body: requestBody);

      if (response.statusCode == 200) {
        Bearer bearer = Bearer.fromJson(jsonDecode(response.body));
        token.value = bearer.accessToken;
        setToken(bearer.accessToken);
        isLoading.value = false;
        update();

        return true;
      } else if (response.statusCode == 422) {
        Get.snackbar('Please Try Again', 'Wrong password or username');
        isLoading.value = false;
        update();
      } else {
        Get.snackbar('Can\'t Access',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
        isLoading.value = false;
        update();
      }

      return false;
    } catch (err) {
      print(" Error message from access Token >>>> ${err.toString()}");
      return false;
    }
  }

  Future<void> setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", value);
    token.value = value;
    update();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString("accessToken") ?? "";
    return token.value;
  }
}
