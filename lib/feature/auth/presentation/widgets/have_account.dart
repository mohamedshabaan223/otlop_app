import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.label,
    required this.child,
    this.onPressed,
  });
  final String label;
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppStyle.text14Semibold.copyWith(color: ColorsManger.grey),
        ),
        CustomButton(onPressed: onPressed, child: child),
      ],
    );
  }
}
