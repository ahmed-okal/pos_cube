import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/food_item_action.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class CategoriesGridView extends GetView<CategoriesController> {
  const CategoriesGridView({
    super.key,
    required this.crossAxisCount,
    required this.index,
  });

  final int crossAxisCount, index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: (controller
                  .categoriesTaskModel.data?[index - 1].products?.isEmpty ??
              true)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.noMeal,
                    height: AppSize.height(120),
                  ),
                  Text(
                    'noMeals'.tr,
                    style: AppTextStyle.lavenderGray32600,
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: EdgeInsetsDirectional.only(
                start: AppSize.width(20),
                end: AppSize.width(20),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: AppSize.height(20),
                crossAxisSpacing: AppSize.width(12),
                childAspectRatio: 1,
              ),
              itemCount: controller
                      .categoriesTaskModel.data?[index - 1].products?.length ??
                  0,
              itemBuilder: (context, itemIndex) {
                final product = controller
                    .categoriesTaskModel.data?[index - 1].products?[itemIndex];
                return FoodItemAction(
                  product: Get.locale == const Locale('ar', 'EG')
                      ? product?.productName?.last.text ?? ''
                      : product?.productName?.first.text ?? '',
                  image: product?.productHomePic ?? '',
                  // image: 'https://picsum.photos/250?image=9',
                  productId: product?.id ?? '',
                  productName: product?.productName?.first.text ?? '',
                  price: product?.price?.toString() ?? '',
                  totalPrice: '${product?.price ?? 0 * (product?.qty ?? 0)}',
                );
              },
            ),
    );
  }
}
