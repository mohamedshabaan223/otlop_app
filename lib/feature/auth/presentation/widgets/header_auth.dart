import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.title, required this.subTitile});
  final String title;
  final String subTitile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.text25Semibold),
        Text(
          subTitile,
          style: AppStyle.text14Semibold.copyWith(color: ColorsManger.grey),
        ),
      ],
    );
  }
}
