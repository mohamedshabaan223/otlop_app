import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/widgets/custom_conter.dart';

class CartItem extends StatelessWidget {
  CartItem({
    super.key,
    required this.counter,
    this.onPressedAdd,
    this.onPressedRemove,
    required this.productName,
    required this.category,
    required this.brand,
    required this.imagePath,
    required this.price,
  });
  int counter;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;

  final String productName, category, brand, imagePath, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(imagePath, width: 90, height: 100),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: AppStyle.text14Sbold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$brand · $category',
                  style: AppStyle.text11Mediem.copyWith(
                    color: Color(0xff9CA3AF),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      '$price EGP',
                      style: AppStyle.text14Sbold.copyWith(
                        color: ColorsManger.primaryColor,
                      ),
                    ),
                    SizedBox(width: 15.h),
                    CustomCounter(
                      onPressedAdd: onPressedAdd,
                      counter: counter,
                      onPressedRemove: onPressedRemove,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
