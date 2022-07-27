import 'dart:async';

import 'package:dayone/screens/splash/splash_widget.dart';
import 'package:dayone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? isFirstLaunch;

  @override
  void initState() {
    super.initState();
    checkFirstTimeLaunch();
    Timer(
      const Duration(seconds: 3),
      () {
        if (isFirstLaunch == 'yes') {
          print('is first launch => $isFirstLaunch');
          Get.offAllNamed('/onboarding');
        } else {
          print('is first launch => $isFirstLaunch');
          Get.offAllNamed('/home');
        }
      },
    );
  }

  Future<void> checkFirstTimeLaunch() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    isFirstLaunch = preference.getString('first_launch');
    if (isFirstLaunch == null) {
      setState(() {
        isFirstLaunch = 'yes';
      });
      preference.setString('first_launch', 'yes');
    } else {
      setState(() {
        isFirstLaunch = 'no';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: splashLogoWidget(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Version: 1.0',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
