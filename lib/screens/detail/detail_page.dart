import 'package:dayone/models/product.dart';
import 'package:dayone/screens/detail/appicon_widget.dart';
import 'package:dayone/screens/detail/comment_page.dart';
import 'package:dayone/screens/detail/detail_widgets.dart';
import 'package:dayone/utils/colors.dart';
import 'package:dayone/widgets/custombutton.dart';
import 'package:dayone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late TabController tabContoller;
  int _counterValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabContoller = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: const AppIcon(
                        icon: Icons.arrow_back_ios,
                        backgroundColor: Colors.white,
                        iconColor: primaryColor,
                      )),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Container(
                  decoration: const BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${Get.arguments['product'].price} MMK',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Row(
                              children: const [
                                BoldFont(text: 'Size:', color: Colors.black45),
                                SizedBox(width: 10),
                                BoldFont(text: 'M')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Color Plate
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldFont(text: '${Get.arguments['product'].title}'),
                            Row(
                              children: const [
                                ColorPlate(color: Colors.red, active: false),
                                ColorPlate(color: Colors.blue, active: false),
                                ColorPlate(color: Colors.brown, active: true),
                              ],
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              pinned: true,
              backgroundColor: primaryColor,
              expandedHeight: Dimensions.detailPageImageHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  '${Get.arguments['product'].image}',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              )),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: BoldFont(text: 'Discount'),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText('10 ခုယူ - 5% Discount'),
                      BoldFont(
                        text:
                            '${Get.arguments['product'].price - Get.arguments['product'].price / 100 * 5} MMK',
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(thickness: 2.0),
                ),

                // size and availability
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: BoldFont(text: 'Size & Availability'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ChoiceChip(
                        label: Text('S'),
                        selected: false,
                      ),
                      ChoiceChip(
                        label: Text('M'),
                        selected: true,
                        selectedColor: Colors.orangeAccent,
                      ),
                      ChoiceChip(
                        label: Text('L'),
                        selected: false,
                      ),
                      ChoiceChip(
                        label: Text('XL'),
                        selected: false,
                      ),
                      ChoiceChip(
                        label: Text('2XL'),
                        selected: false,
                      ),
                      InputChip(
                        label: Text('3XL'),
                        selected: false,
                      ),
                    ],
                  ),
                ),

                TabBar(
                    indicator: const BoxDecoration(color: primaryColor),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    controller: tabContoller,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Description"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Specification"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Comment"),
                      ),
                    ]),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBarView(
                controller: tabContoller,
                children: <Widget>[
                  ExpandableTextWidget(
                      text: '${Get.arguments['product'].description}'),
                  // Container(
                  //     child: Text('${Get.arguments['product'].description}')),

                  Text("Tab 2"),
                  CommentPage(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.detailPageBottomHeight,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SubTitleText('Quantity '), _counterWidget()],
            ),
            const SizedBox(height: 8),
            InkWell(
                onTap: () {
                  setState(() {
                    _counterValue = 0;
                  });
                },
                child: Expanded(
                    child: CustomButton('Add to Cart', Colors.black87)))
          ],
        ),
      ),
    );
  }

  Widget _counterWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54, width: 2),
          color: Colors.white),
      child: Row(children: [
        InkWell(
          onTap: () {
            if (_counterValue > 0) {
              setState(() {
                _counterValue--;
              });
            }
          },
          child: Icon(
            Icons.remove,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        SizedBox(width: 10),
        Text(
          _counterValue.toString(),
          style: TextStyle(
              fontSize: 20, color: primaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            setState(() {
              _counterValue++;
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ]),
    );
  }
}
