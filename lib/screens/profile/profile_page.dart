import 'package:dayone/controllers/access_token_controller.dart';
import 'package:dayone/screens/login/login_controller.dart';
import 'package:dayone/screens/profile/profile_controller.dart';
import 'package:dayone/utils/colors.dart';
import 'package:dayone/utils/dimensions.dart';
import 'package:dayone/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 60.0),
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black54,
          ),
        ),
      ),
      body: Obx(
        () => profileController.isLoading.isFalse
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      profileInfo(profileController),
                      const SizedBox(height: 20),
                      infoList(profileController)
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget infoList(ProfileController profileController) {
    return Column(
      children: [
        ListWidget(Icons.person_outline, profileController.name.value, "@name"),
        ListWidget(Icons.phone, profileController.phone.value, "@phone"),
        ListWidget(Icons.mail, profileController.email.value, "@email"),
        ListWidget(Icons.work, profileController.duty.value, "@duty"),
        ListWidget(Icons.home, profileController.warehouse.value, "@warehouse"),
      ],
    );
  }

  Widget ListWidget(IconData icon, String text, String tag) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 20),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SmallText(text),
            )),
            const SizedBox(width: 20),
            Text(
              tag,
              style: TextStyle(color: accentColor, fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }

  Widget profileInfo(ProfileController profileController) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.only(top: 50),
          child: Stack(
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/icons/profile.png'),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => Text(
            "@${profileController.username.value}",
          ),
        ),
        const SizedBox(height: 5),
        Obx(
          () => SmallText(profileController.email.value),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () async {
            Get.find<LoginController>().alterLogin();
            Get.find<AccessTokenController>().setToken("");
            Get.back();
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.screenWidth / 5.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.logout, color: Colors.white70),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
