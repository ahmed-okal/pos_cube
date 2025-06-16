import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppSize.width(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: AppSize.height(22),
            ),
            SizedBox(
              width: AppSize.width(5),
            ),
            Text(
              title,
              style: AppTextStyle.primary16600,
            ),
          ],
        ),
      ),
    );
  }
}
