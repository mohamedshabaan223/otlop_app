import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Categories', style: AppStyle.text18Bold),
        Text(
          'See all',
          style: AppStyle.text14Sbold.copyWith(
            color: ColorsManger.primaryColor,
          ),
        ),
      ],
    );
  }
}
