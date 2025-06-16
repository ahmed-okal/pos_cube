import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// الحصول على بيانات الشاشة من النافذة
// ignore: deprecated_member_use
MediaQueryData mediaQueryData = MediaQueryData.fromView(ui.window);

// تحديد الاتجاه بناءً على مقارنة العرض والارتفاع
final bool isPortrait = mediaQueryData.size.height >= mediaQueryData.size.width;

// استخدام 1133 للبُعد الأكبر و744 للبُعد الأصغر
final num figmaDesignWidth = isPortrait ? 744 : 1133;
final num figmaDesignHeight = isPortrait ? 1133 : 744;
// const num figmaDesignStatusBar = 22;

/// طريقة للحصول على عرض الشاشة الحالي
get _width {
  return mediaQueryData.size.width;
}

/// طريقة للحصول على ارتفاع الشاشة الحالي بعد خصم الحواف العلوية والسفلية
get _height {
  num statusBar = mediaQueryData.viewPadding.top;
  num bottomBar = mediaQueryData.viewPadding.bottom;
  num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
  return screenHeight;
}

/// دالة لحساب الحجم الأفقي (مثل padding, margin, أو حجم الودجت) بناءً على نسبة العرض
double getHorizontalSize(double px) {
  return ((px * _width) / figmaDesignWidth);
}

/// دالة لحساب الحجم العمودي (مثل padding, margin, أو ارتفاع الودجت) بناءً على نسبة الارتفاع
double getVerticalSize(double px) {
  return ((px * _height) / (figmaDesignHeight));
}

/// دالة للحصول على أصغر قيمة بين الحجم الأفقي والعمودي، تستخدم لتحديد الحجم العام للعناصر
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  return (height < width ? height : width).toDoubleValue();
}

/// دالة لضبط حجم خط النص بشكل يتناسب مع أبعاد الشاشة
double getFontSize(double px) {
  return getSize(px);
}

/// دالة لضبط الـ padding بشكل استجابي
EdgeInsets getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

/// دالة لضبط الـ margin بشكل استجابي
EdgeInsets getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

/// دالة مشتركة لحساب الـ padding أو الـ margin بشكل استجابي
EdgeInsets getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(left ?? 0),
    top: getVerticalSize(top ?? 0),
    right: getHorizontalSize(right ?? 0),
    bottom: getVerticalSize(bottom ?? 0),
  );
}

extension FormatExtension on double {
  /// ترجع قيمة [double] منسقة بعدد الأرقام العشرية المحددة (افتراضي 2)
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
