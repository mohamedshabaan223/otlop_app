import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/colors_manger.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsManger.primaryColor.withAlpha(25),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: ColorsManger.primaryColor),
          Text(
            '14 Tahrir Square, Cairo',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: ColorsManger.primaryColor,
          ),
        ],
      ),
    );
  }
}
