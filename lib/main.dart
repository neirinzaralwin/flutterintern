import 'package:dayone/screens/detail/detail_page.dart';
import 'package:dayone/screens/home/home_page.dart';
import 'package:dayone/screens/login/login_page.dart';
import 'package:dayone/screens/onboarding/onboarding_page.dart';
import 'package:dayone/screens/privacy_policy/privacy_policy_page.dart';
import 'package:dayone/screens/register/register_page.dart';
import 'package:dayone/screens/splash/splash_page.dart';
import 'package:dayone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Map<int, Color> color = {
    50: Color.fromRGBO(135, 128, 94, .1),
    100: Color.fromRGBO(135, 128, 94, .2),
    200: Color.fromRGBO(135, 128, 94, .3),
    300: Color.fromRGBO(135, 128, 94, .4),
    400: Color.fromRGBO(135, 128, 94, .5),
    500: Color.fromRGBO(135, 128, 94, .6),
    600: Color.fromRGBO(135, 128, 94, .7),
    700: Color.fromRGBO(135, 128, 94, .8),
    800: Color.fromRGBO(135, 128, 94, .9),
    900: Color.fromRGBO(135, 128, 94, 1),
  };
  MaterialColor primecolor = const MaterialColor(0xFF87805E, color);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DayOne',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        primarySwatch: primecolor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/onboarding', page: () => OnBoardingPage()),
        GetPage(name: '/privacypolicy', page: () => const PrivacyPolicyPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailPage()),
      ],
    );
  }
}
