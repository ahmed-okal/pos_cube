import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/cash_in_out_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class CashInOutBody extends GetView<CashInOutController> {
  const CashInOutBody({
    super.key,
    required this.cash,
    required this.note,
    required this.cashKey,
    required this.noteKey,
  });
  final TextEditingController cash, note;
  final Key cashKey, noteKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'amount'.tr,
              style: AppTextStyle.primary14600,
            ),
            SizedBox(
              width: AppSize.width(8),
            ),
            SizedBox(
              height: AppSize.height(42),
              width: AppSize.width(183),
              child: Form(
                key: cashKey,
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(),
                  style: AppTextStyle.primary18800,
                  controller: cash,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondry,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondry,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.height(15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: AppSize.height(3),
                ),
                Text(
                  'reason'.tr,
                  style: AppTextStyle.primary14600,
                ),
              ],
            ),
            SizedBox(
              width: AppSize.width(8),
            ),
            Expanded(
              child: SizedBox(
                child: Form(
                  key: noteKey,
                  child: TextFormField(
                    style: AppTextStyle.primary18800,
                    controller: note,
                    maxLines: 4,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondry,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondry,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
