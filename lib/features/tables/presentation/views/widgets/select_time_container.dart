// import 'package:flutter/material.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
// import 'package:get/get.dart';

// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_text_style.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../getx/controllers/time_picker_controller.dart';

// class SelectTimeContainer extends GetView<TimePickerController> {
//   const SelectTimeContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // START TIME
//         Obx(() => Container(
//               height: AppSize.height(114),
//               width: AppSize.width(150),
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.primaryWithOpacity2),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Directionality(
//                     textDirection: TextDirection.ltr,
//                     child: TimePickerSpinner(
//                       minutesInterval: 15,
//                       is24HourMode: false,
//                       isForce2Digits: true,
//                       normalTextStyle: AppTextStyle.lavndery2Gray14600,
//                       highlightedTextStyle: AppTextStyle.primary14600,
//                       spacing: AppSize.width(16),
//                       itemHeight: AppSize.height(38),
//                       itemWidth: AppSize.width(35),
//                       time: DateTime(
//                         0,
//                         0,
//                         0,
//                         controller.selectedStartTime.value.hour,
//                         controller.selectedStartTime.value.minute,
//                       ),
//                       onTimeChange: (dateTime) {
//                         controller.selectedStartTime.value = TimeOfDay(
//                           hour: dateTime.hour,
//                           minute: dateTime.minute,
//                         );
//                       },
//                     ),
//                     //             child: DecimalNumberPicker(
//                     //   value: controller.selectedStartTime.value.hour,
//                     //   minValue: 01,
//                     //   maxValue: 12,
//                     //   textStyle: ,
//                     //   selectedTextStyle: ,
//                     //   decimalPlaces: 1,
//                     //   onChanged: (dateTime) {
//                     //                 controller.selectedStartTime.value = TimeOfDay(
//                     //                   hour: dateTime.hour,
//                     //                   minute: dateTime.minute,
//                     //                 );
//                     //               },
//                     // ),
//                   ),
//                   Positioned.directional(
//                     textDirection: TextDirection.ltr,
//                     start: AppSize.width(55),
//                     end: Get.locale == const Locale('ar', 'EG')
//                         ? AppSize.width(130)
//                         : 0,
//                     top: AppSize.height(8),
//                     child: Text(
//                       ':',
//                       style: AppTextStyle.lavndery2Gray14600,
//                     ),
//                   ),
//                   Positioned.directional(
//                     textDirection: TextDirection.ltr,
//                     start: AppSize.width(55),
//                     end: Get.locale == const Locale('ar', 'EG')
//                         ? AppSize.width(130)
//                         : 0,
//                     top: AppSize.height(47),
//                     child: Text(
//                       ':',
//                       style: AppTextStyle.primary14700,
//                     ),
//                   ),
//                   Positioned.directional(
//                     textDirection: TextDirection.ltr,
//                     start: AppSize.width(55),
//                     end: Get.locale == const Locale('ar', 'EG')
//                         ? AppSize.width(130)
//                         : 0,
//                     top: AppSize.height(84),
//                     child: Text(
//                       ':',
//                       style: AppTextStyle.lavndery2Gray14600,
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: AppSize.height(38),
//                     child: Divider(
//                       color: AppColors.primaryWithOpacity2,
//                       height: 1,
//                       thickness: 1,
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: AppSize.height(76),
//                     child: Divider(
//                       color: AppColors.primaryWithOpacity2,
//                       height: 1,
//                       thickness: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         // SizedBox(
//         //   height: AppSize.height(8),
//         // ),
//         // Text(
//         //   'endTime'.tr,
//         //   style: AppTextStyle.primary16700,
//         // ),
//         // Obx(
//         //   () => Container(
//         //     height: AppSize.height(114),
//         //     width: AppSize.width(175),
//         //     decoration: BoxDecoration(
//         //       border: Border.all(color: AppColors.primaryWithOpacity2),
//         //       borderRadius: BorderRadius.circular(6),
//         //     ),
//         //     child: Stack(
//         //       alignment: Alignment.center,
//         //       children: [
//         //         Directionality(
//         //           textDirection: TextDirection.ltr,
//         //           child: TimePickerSpinner(
//         //             is24HourMode: false,
//         //             isForce2Digits: true,
//         //             normalTextStyle: AppTextStyle.lavndery2Gray14600,
//         //             highlightedTextStyle: AppTextStyle.primary14600,
//         //             spacing: AppSize.width(16),
//         //             itemHeight: AppSize.height(38),
//         //             itemWidth: AppSize.width(40),
//         //             time: DateTime(
//         //               0,
//         //               0,
//         //               0,
//         //               controller.selectedEndTime.value.hour,
//         //               controller.selectedEndTime.value.minute,
//         //             ),
//         //             onTimeChange: (dateTime) {
//         //               controller.selectedEndTime.value = TimeOfDay(
//         //                 hour: dateTime.hour,
//         //                 minute: dateTime.minute,
//         //               );
//         //             },
//         //           ),
//         //         ),
//         //         Positioned.directional(
//         //           textDirection: TextDirection.ltr,
//         //           start: AppSize.width(65),
//         //           end: 0,
//         //           top: AppSize.height(8),
//         //           child: Text(
//         //             ':',
//         //             style: AppTextStyle.lavndery2Gray14600,
//         //           ),
//         //         ),
//         //         Positioned.directional(
//         //           textDirection: TextDirection.ltr,
//         //           start: AppSize.width(65),
//         //           end: 0,
//         //           top: AppSize.height(47),
//         //           child: Text(
//         //             ':',
//         //             style: AppTextStyle.primary14700,
//         //           ),
//         //         ),
//         //         Positioned.directional(
//         //           textDirection: TextDirection.ltr,
//         //           start: AppSize.width(65),
//         //           end: 0,
//         //           top: AppSize.height(84),
//         //           child: Text(
//         //             ':',
//         //             style: AppTextStyle.lavndery2Gray14600,
//         //           ),
//         //         ),
//         //         Positioned(
//         //           left: 0,
//         //           right: 0,
//         //           top: AppSize.height(38),
//         //           child: Divider(
//         //             color: AppColors.primaryWithOpacity2,
//         //             height: 1,
//         //             thickness: 1,
//         //           ),
//         //         ),
//         //         Positioned(
//         //           left: 0,
//         //           right: 0,
//         //           top: AppSize.height(76),
//         //           child: Divider(
//         //             color: AppColors.primaryWithOpacity2,
//         //             height: 1,
//         //             thickness: 1,
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
