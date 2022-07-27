import 'package:dayone/screens/home/itemcardwidget.dart';
import 'package:dayone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> _myJson = [
    {"id": 1, "name": "All List"},
    {"id": 2, "name": "Shampoo"},
    {"id": 3, "name": "Face Cream"},
    {"id": 3, "name": "Hand Sanitizer"},
  ];

  var _mySelection;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    checkLogIn();
  }

  Future<void> checkLogIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool('isLogin');
    if (value == null || value == false) {
      preferences.setBool('isLogin', false);
      setState(() {
        isLogin = false;
      });
    } else {
      setState(() {
        preferences.setBool('isLogin', true);
        isLogin = true;
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Please confirm'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return exitResult ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: scaffoldBackgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    if (isLogin == false) {
                      Get.toNamed('/login');
                    } else {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setBool('isLogin', false);
                      setState(() {
                        isLogin = !isLogin;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Text(isLogin ? 'LOG OUT' : 'SIGN IN',
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 14)),
                    ],
                  ),
                ),
                DropdownButton(
                  items: _myJson.map((item) {
                    return DropdownMenuItem(
                      value: item['name'],
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(item['name'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      _mySelection = newvalue;
                    });
                  },
                  hint: Text(_myJson[0]["name"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  value: _mySelection,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
              child: Text(
                'All Brand',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 2) {
                        return ItemCard(
                            product: products[index],
                            press: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => DetailPage(
                              //       product: products[index],
                              //     ),
                              //   ),
                              // );

                              Get.toNamed('/detail', arguments: {
                                "product": products[index],
                              });
                            },
                            showBadge: true);
                      }
                      return ItemCard(
                          product: products[index],
                          press: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailPage(
                            //       product: products[index],
                            //     ),
                            //   ),
                            // );

                            Get.toNamed('/detail', arguments: {
                              "product": products[index],
                            });
                          },
                          showBadge: false);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
