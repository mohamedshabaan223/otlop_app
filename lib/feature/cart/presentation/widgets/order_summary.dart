import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/cart/presentation/widgets/row_price.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order summary', style: AppStyle.text15Bold),
          SizedBox(height: 10.h),
          RowPrice(
            label: 'Subtotal',
            price: '640 EGP',
            textStylePrice: AppStyle.text14Semibold,
            textStyleLabel: AppStyle.text14SMedium.copyWith(
              color: Color(0xff9CA3AF),
            ),
          ),
          SizedBox(height: 8.h),
          RowPrice(
            label: 'Delivery fee',
            price: '25 EGP',
            textStylePrice: AppStyle.text14Semibold,
            textStyleLabel: AppStyle.text14SMedium.copyWith(
              color: Color(0xff9CA3AF),
            ),
          ),
          Divider(height: 20.h),
          RowPrice(
            label: 'Total',
            price: '665 EGP',
            textStylePrice: AppStyle.text16Bold.copyWith(
              color: ColorsManger.primaryColor,
            ),
            textStyleLabel: AppStyle.text16Bold,
          ),
        ],
      ),
    );
  }
}
