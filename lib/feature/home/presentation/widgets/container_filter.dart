import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';

class ContainerFilter extends StatelessWidget {
  const ContainerFilter({
    super.key,

    required this.label,
    required this.containerColor,
    required this.labelColor,
  });

  final String label;
  final Color containerColor;

  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: containerColor,
      ),
      child: Text(
        label,
        style: AppStyle.text14Sbold.copyWith(color: labelColor),
      ),
    );
  }
}
