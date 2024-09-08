import 'package:flutter/material.dart';

extension SizeApp on BuildContext {
   

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

   bool get isMobile => width <600;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomHeight => MediaQuery.of(this).viewInsets.bottom;

  double get bottomHeightWithAppBar => height - statusBarHeight - kToolbarHeight;
  double setHeight(double? h) => height * h! / 100;
   double setWidth(double? w) => width * w! / 100;

  double setFontSize(double? f) {
    return isMobile ? (width / 2) * f! / 100 : (height / 3) * f! / 100;
  }

  double setRadius(double? r) {
    return width * r! / 100;
  }

  double setPadding(double? p) {
    return width * p! / 100;
  }

  double setMargin(double? m) {
    return width * m! / 100;
  }

  double setIconSize(double? i) {
    return width * i! / 100;
  }

}