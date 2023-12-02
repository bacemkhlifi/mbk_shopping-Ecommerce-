import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/cart_controller.dart';
import 'CartItems.dart';
import 'EmptyCartScreen.dart';
import 'TotalCartScreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    print(controller.products.length);
    return Scaffold(
      
      body: controller.products.length == 0
          ? Container(child: EmptyCartScreen()): Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 200),
                        height: MediaQuery.of(context).size.height,
                        child:  const PanierCard()),
                  ],
                ))),
                Container(child: TotalCartScreen())
              ],
            )
          ,
    );
  }
}

/* Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text(
                    "articles ne nécessitant pas de ordonnance",
                    style: TextStyles.kNomralTextStyle
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  PanierCard(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text(
                    "articles nécessitant une ordonnance",
                    style: TextStyles.kNomralTextStyle
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  PanierCard(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 6,
                  ),
                  alignment: Alignment.centerLeft,
                  height: SizeConfig.blockSizeVertical * 6,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total",
                        style: TextStyles.kNomralTextStyle,
                      ),
                      Text(
                        "300£",
                        style: TextStyles.kcardTextStyle
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal * 70,
                height: SizeConfig.safeBlockVertical * 6,
                child: TextButton.icon(
                  onPressed: () {
                    Get.toNamed('/paycommande');
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Passer la commande",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kprimaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )*/