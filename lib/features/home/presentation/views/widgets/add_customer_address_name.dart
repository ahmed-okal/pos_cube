import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class AddCustomerAddressName extends StatelessWidget {
  const AddCustomerAddressName({
    super.key,
    required this.title,
    // required this.lines,
    this.controller,
    required this.hint,
    required this.height,
    this.validator,
  });
  final String title, hint;
  // final int lines;
  final String? Function(String?)? validator;
  final double height;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.primary16700,
        ),
        SizedBox(
          height: AppSize.height(8),
        ),
        SizedBox(
          height: height,
          child: TextFormField(
            validator: validator,
            minLines: null,
            maxLines: null,
            controller: controller,
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
