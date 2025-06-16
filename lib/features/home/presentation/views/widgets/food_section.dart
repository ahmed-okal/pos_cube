import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/search_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/catigories_section.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/food_item_action.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/food_view.dart';

import '../../../../../core/utils/size_config.dart';

class FoodSection extends GetView<SearchFoodController> {
  final int crossAxisCount;

  const FoodSection({
    super.key,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.background,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              // left: AppSize.width(8),
              // right: AppSize.width(8),
              // top: AppSize.height(8),
              ),
          child: Obx(() {
            final searchData = controller.searchModel.value.data;

            if (controller.isSearch.value) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: (searchData == null || searchData.isEmpty)
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
                        itemCount: searchData.length,
                        itemBuilder: (context, index) {
                          final product = searchData[index];
                          final productName = Get.locale ==
                                  const Locale('ar', 'EG')
                              ? (product.productName?.last.text?.isNotEmpty ==
                                      true
                                  ? product.productName!.last.text
                                  : product.productName!.first.text)
                              : (product.productName?.first.text?.isNotEmpty ==
                                      true
                                  ? product.productName!.first.text
                                  : product.productName!.last.text);
                          return FoodItemAction(
                            totalPrice:
                                '${product.price ?? 0 * (product.qty ?? 0)}',
                            product: productName ?? '',
                            image: product.productHomePic ?? '',
                            // image: 'https://picsum.photos/250?image=9',
                            productId: product.id ?? '',
                            productName: productName ?? '',
                            price: product.price?.toString() ?? '',
                          );
                        },
                      ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoriesSection(),
                  FoodView(crossAxisCount: crossAxisCount),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
