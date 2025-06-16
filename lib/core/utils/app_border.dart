import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBorder {
  static final OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.lightGrey,
    ),
    borderRadius: BorderRadius.circular(30),
  );

  static final OutlineInputBorder focusTextFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor,
    ),
    borderRadius: BorderRadius.circular(30),
  );

  static final OutlineInputBorder errorTextFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.error,
    ),
    borderRadius: BorderRadius.circular(30),
  );
  static final RoundedRectangleBorder checkBoxBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  );
  static final BorderRadiusGeometry imageBorder = BorderRadius.circular(
    16,
  );
  static final BorderRadiusGeometry button = BorderRadius.circular(
    32,
  );
}
