import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controllers/close_session_controller.dart';

class CloseRegisterMoneyCounter extends GetView<CloseSessionController> {
  const CloseRegisterMoneyCounter({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.textStyle,
  });
  final String itemName, itemPrice;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          itemName,
          style: textStyle,
        ),
        const Spacer(),
        Text(
          '$itemPrice ',
          style: textStyle,
        ),
        Text(
          'SR'.tr,
          style: textStyle,
        ),
      ],
    );
  }
}
