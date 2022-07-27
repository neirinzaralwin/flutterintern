import 'package:dayone/screens/splash/splash_widget.dart';
import 'package:dayone/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.privacyPolicyHorizontalPading),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Center(
            child: splashLogoWidget(),
          ),
          const SizedBox(height: 30),
          const Text(
            'This app is intended for Line Delivery employee and delivery personal only and GPS permission are required for app functionality',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          // Accept the privacy
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (_) {
                  setState(() {
                    value = !value;
                  });
                },
              ),
              const Text(
                'Yes. I accept and continue.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // Button
          InkWell(
            onTap: () {
              if (value) {
                Get.offAllNamed('/register');
              }
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        value ? primaryColor : primaryColor.withOpacity(0.7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
