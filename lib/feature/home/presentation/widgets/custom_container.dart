import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.containerColor,
    required this.textColor,
    required this.text,
  });
  final Color containerColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        text,
        style: AppStyle.text11Semibold.copyWith(color: textColor),
      ),
    );
  }
}
