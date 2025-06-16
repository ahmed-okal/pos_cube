import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class ActionsDialogBodyItem extends StatelessWidget {
  const ActionsDialogBodyItem({
    super.key,
    required this.title,
    required this.icon,
    this.style,
    this.color,
  });
  final String title, icon;
  final TextStyle? style;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(125),
      width: AppSize.width(195),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          const Radius.circular(9.39),
        ),
        border: Border.all(
          color: color ?? AppColors.lavenderGray,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: AppSize.height(43),
            width: AppSize.height(43),
          ),
          SizedBox(
            height: AppSize.height(8),
          ),
          Text(
            title,
            style: style ?? AppTextStyle.primary18700,
          ),
        ],
      ),
    );
  }
}
