import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_widget.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/tables_controller.dart';

class TablesGidView extends GetView<TablesController> {
  const TablesGidView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          //  SingleChildScrollView(
          //   child:
          SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(32),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: AppSize.height(30),
            crossAxisSpacing: AppSize.width(30),
          ),
          itemCount: controller.tablesModel
                  .data?[controller.selectTablesPlase.value].tables?.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            final table = controller.tablesModel
                .data?[controller.selectTablesPlase.value].tables?[index];
            final imagePath = controller.getTableImage(
              table?.noOfSeats,
              table?.status,
            );

            return InkWell(
              onTap: () {
                if (index == controller.selectedTable.value) {
                  controller.setSelectedTable(-1);
                } else {
                  controller.setSelectedTable(index);
                }
              },
              child: TablesWidget(
                index: index,
                tableCode: table?.tableCode?.trim() ?? '',
                imagePath: imagePath,
              ),
            );
          },
        ),
      ),
      // ),
    );
  }
}
