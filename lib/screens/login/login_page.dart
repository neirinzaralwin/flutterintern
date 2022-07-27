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
  final TextEditingController phoneEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
          child: CustomTextField(Icons.private_connectivity, 'Phone No/ Email',
              phoneEmailController),
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
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool('isLogin', true);
                Get.offAllNamed('/home');
              },
              child: CustomButton('Login', Colors.black87)),
        )
      ],
    ));
  }
}
