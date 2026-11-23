import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class HeaderFilters extends StatelessWidget {
  const HeaderFilters({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: ColorsManger.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        SizedBox(width: 12.w),
        Text(label, style: AppStyle.text20Bold),
      ],
    );
  }
}
