import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class AuthInfo extends StatelessWidget {
  const AuthInfo({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffix,
  });
  final String label;
  final String hintText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyle.text14Semibold.copyWith(
            color: ColorsManger.primaryColor,
          ),
        ),
        SizedBox(height: 7.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            suffix: suffix,
            hint: Text(
              hintText,
              style: AppStyle.text14Semibold.copyWith(color: ColorsManger.grey),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
