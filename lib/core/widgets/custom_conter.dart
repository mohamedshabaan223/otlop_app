import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';

class CustomCounter extends StatelessWidget {
  CustomCounter({
    super.key,
    this.onPressedAdd,
    this.onPressedRemove,
    required this.counter,
    this.raduis,
  });
  int counter;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  final double? raduis;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(raduis ?? 0),
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CustomButton(
            shape: CircleBorder(),
            buttonBackground: Color(0XFFF3F4F6),
            onPressed: onPressedRemove,

            child: Icon(Icons.remove, color: Color(0XFFD1D5DB)),
          ),

          Text(counter.toString(), style: AppStyle.text14Sbold),

          CustomButton(
            shape: CircleBorder(),
            buttonBackground: ColorsManger.primaryColor,
            onPressed: onPressedAdd,
            child: Icon(Icons.add, color: ColorsManger.white),
          ),
        ],
      ),
    );
  }
}
