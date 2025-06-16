import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteTabBarButton extends GetView<KitchenNoteController> {
  const KitchenNoteTabBarButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: AppSize.height(33),
        width: AppSize.width(107),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1.5,
            color: AppColors.primaryColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style:
              isSelected ? AppTextStyle.white16800 : AppTextStyle.primary16800,
        ),
      ),
    );
  }
}
