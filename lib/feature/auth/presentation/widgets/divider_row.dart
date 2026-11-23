import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: ColorsManger.black, endIndent: 19)),
        Text(
          'Or With',
          style: AppStyle.text14Semibold.copyWith(color: ColorsManger.grey),
        ),
        Expanded(child: Divider(color: ColorsManger.black, indent: 19)),
      ],
    );
  }
}
