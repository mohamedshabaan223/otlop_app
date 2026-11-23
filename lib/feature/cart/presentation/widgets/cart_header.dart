import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Cart', style: AppStyle.text30ExtrBold),
        Text(
          ' items · $total EGP',
          style: AppStyle.text13Mediem.copyWith(color: Color(0xff6B7280)),
        ),
      ],
    );
  }
}
