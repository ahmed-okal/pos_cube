import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class TableStatusWidget extends StatelessWidget {
  const TableStatusWidget({
    super.key,
    required this.state,
    required this.stateColor,
  });
  final String state;
  final Color stateColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSize.height(3.5),
          backgroundColor: stateColor,
        ),
        SizedBox(
          width: AppSize.width(2),
        ),
        Text(
          state,
          style: AppTextStyle.primary12700,
        )
      ],
    );
  }
}
