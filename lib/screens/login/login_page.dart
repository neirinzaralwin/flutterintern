import 'package:dayone/controllers/access_token_controller.dart';
import 'package:dayone/screens/login/login_controller.dart';
import 'package:dayone/screens/register/register_widget.dart';
import 'package:dayone/screens/splash/splash_widget.dart';
import 'package:dayone/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final accessTokenController = Get.find<AccessTokenController>();
  final loginController = Get.find<LoginController>();

  // final url = "http://test.ntrcarparts.xyz/api/delivery/login";

  // void postData() async {
  //   try {
  //     var requestBody = {
  //       'username': 'deliveryman1',
  //       'password': 'deliveryman1'
  //     };

  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       body: requestBody,
  //     );

  //     print(response.body);
  //   } catch (e) {
  //     print(" Error message from post >>>> ${e.toString()}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          splashLogoWidget(),
          // Welcome
          const Text(
            'WELCOME',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Center(
            child: CustomTextField(
                Icons.private_connectivity, 'User Name', nameController),
          ),
          const SizedBox(
            height: 10,
          ),

          Center(
            child: CustomTextField(Icons.lock, 'Password', passwordController),
          ),
          const SizedBox(
            height: 10,
          ),

          InkWell(
              onTap: () {
                Get.toNamed('/register');
              },
              child: const Text(
                'Don\'t you have account? Register now.',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              )),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20,
            ),
            child: InkWell(
                onTap: () async {
                  bool getToken = await accessTokenController.sendRequest(
                      nameController.text, passwordController.text);

                  if (getToken) {
                    loginController.setLogin(true);
                    Get.offAllNamed('/home');
                  }
                },
                child: CustomButton('Login', Colors.black87)),
          ),
          const SizedBox(height: 20),

          Obx(() => accessTokenController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container())
        ],
      ),
    ));
  }
}
