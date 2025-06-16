import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    super.key,
    required this.image,
    required this.product,
  });

  final String image;
  final String product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.third,
        ),
        color: AppColors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.asset(
                AppAssets.errorImage,
                fit: BoxFit.cover,
              ),
              height: AppSize.height(112),
              imageUrl: image,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(2),
            ),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                product,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyle.primary16700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
