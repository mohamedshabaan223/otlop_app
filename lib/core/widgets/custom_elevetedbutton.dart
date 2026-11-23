import 'package:flutter/material.dart';
import 'package:otlop_app/core/colors_manger.dart';

class CustomElevetedbutton extends StatelessWidget {
  const CustomElevetedbutton({
    super.key,
    this.onPressed,
    this.child,
    required this.radius,
    this.fixedSize,
    this.backgroundColor,
  });
  final void Function()? onPressed;
  final Widget? child;
  final double radius;
  final Size? fixedSize;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorsManger.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: fixedSize,
        minimumSize: Size(double.infinity, 45),
      ),
      child: child,
    );
  }
}
