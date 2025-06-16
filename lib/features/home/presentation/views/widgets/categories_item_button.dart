import 'package:flutter/material.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';

import '../../../../../core/utils/size_config.dart';

class CategoriesItemButton extends StatelessWidget {
  const CategoriesItemButton({
    super.key,
    required this.color,
    required this.text,
    required this.style,
  });

  final Color color;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: BoxConstraints(
        minWidth: AppSize.width(92),
      ),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryWithOpacity,
          width: 2,
        ),
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(12),
          ),
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
