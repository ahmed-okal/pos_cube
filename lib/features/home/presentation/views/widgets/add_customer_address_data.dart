import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class AddNewCustomerAddressData extends StatelessWidget {
  const AddNewCustomerAddressData({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    required this.keyboardType,
    this.inputFormatters,
    this.validator,
  });
  final String title, hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.primary16700),
        SizedBox(
          height: AppSize.height(8),
        ),
        SizedBox(
          height: AppSize.height(36),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.only(
                start: AppSize.width(13),
                top: AppSize.height(4),
                bottom: AppSize.height(4),
              ),
              hintText: hint,
              hintStyle: AppTextStyle.lavenderGray15400,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppColors.primaryWithOpacity2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppColors.primaryWithOpacity2,
                ),
              ),
              errorStyle: AppTextStyle.red14700.copyWith(fontSize: 0),
            ),
          ),
        ),
      ],
    );
  }
}
