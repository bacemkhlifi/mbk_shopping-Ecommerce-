import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class TotalCartScreen extends StatelessWidget {
  final CartController controller = Get.find();

  TotalCartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),

                  Text(
                    controller.products.length != 0
                        ? '€ ${controller.total}'
                        : "\$0",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              //double amountdouble = double.parse(controller.total);
              //int amountint = amountdouble.toInt() * 100;

              //String amount = amountint.toString();
              //Get.toNamed('/paycommande?amount=$amount');
            },
            icon: Icon(
              Icons.arrow_forward,
              
            ),
            label: Text(
              "Place order",
              
            ),
            style: TextButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        )
      ],
    ); // Row // Container
  }
}
