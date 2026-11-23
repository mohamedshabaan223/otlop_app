import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/images_mangers.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hint: Text(
                hintText,
                style: AppStyle.text24Regular.copyWith(
                  color: ColorsManger.grey,
                ),
              ),
              filled: true,
              fillColor: ColorsManger.white,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        CustomButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          buttonBackground: ColorsManger.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 7.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: ColorsManger.primaryColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                SizedBox(height: 2.h),
                SvgPicture.asset(ImagesMangers.vectorIcon, width: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
