import 'package:dayone/screens/register/register_widget.dart';
import 'package:dayone/screens/splash/splash_widget.dart';
import 'package:dayone/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController phoneEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reenterpasswordController =
      TextEditingController();

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
          child: CustomTextField(Icons.person, 'Name', nameController),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: CustomTextField(
              Icons.calendar_month, 'Date of Birth', dateOfBirthController),
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
        Center(
          child: CustomTextField(
              Icons.lock, 'Reenter password', reenterpasswordController),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20,
          ),
          child: InkWell(
              onTap: () {
                Get.offAllNamed('/home');
              },
              child: CustomButton('Register', Colors.black87)),
        )
      ],
    ));
  }
}
