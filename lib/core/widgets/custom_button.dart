import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.child,
    this.buttonBackground,
    this.shape,
  });
  final void Function()? onPressed;
  final Widget child;
  final Color? buttonBackground;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,

        backgroundColor: buttonBackground,
        shape: shape,
      ),

      child: child,
    );
  }
}
