import 'package:dayone/models/product.dart';
import 'package:dayone/screens/home/discountbadge.dart';
import 'package:dayone/utils/colors.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final press;
  final bool showBadge;
  const ItemCard({
    Key? key,
    required this.product,
    Function? this.press,
    required this.showBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String price = product.price.toString();

    return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
        child: InkWell(
          onTap: press,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              product.image,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Text(product.title)),
                          const SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            '$price Ks',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                showBadge
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8.0,
                              width: 5.0,
                              child: CustomPaint(
                                painter: DiscountBadge(),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6.0),
                                      bottomLeft: Radius.circular(6.0))),
                              width: 70.0,
                              height: 30.0,
                              child: const Center(
                                child: Text(
                                  '-50%',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ));
  }
}
