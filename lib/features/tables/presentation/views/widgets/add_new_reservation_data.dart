import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class AddNewReservationData extends StatelessWidget {
  const AddNewReservationData({
    super.key,
    required this.data,
    required this.textEditingController,
    this.inputFormatters,
    this.maxLength,
    required this.width,
    this.textAlign = TextAlign.start,
    this.onChange,
    required this.hintText,
    this.autofocus = false,
  });
  final String data, hintText;
  final TextEditingController textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final double width;
  final int? maxLength;
  final TextAlign textAlign;
  final void Function(String)? onChange;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data,
          style: AppTextStyle.primary16700,
        ),
        SizedBox(
          height: AppSize.height(36),
          width: width,
          child: TextFormField(
            autofocus: autofocus,
            textAlign: textAlign,
            maxLength: maxLength,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'fieldRequired'.tr;
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: inputFormatters,
            controller: textEditingController,
            style: AppTextStyle.primary16700,
            decoration: InputDecoration(
              errorStyle: AppTextStyle.red14700.copyWith(
                fontSize: 0,
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.lavenderGray11600,
              counterText: '',
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.height(2),
                horizontal: AppSize.width(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lavenderGray,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.lavenderGray,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
