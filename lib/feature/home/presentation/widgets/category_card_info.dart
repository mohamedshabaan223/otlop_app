import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';
import 'package:otlop_app/feature/home/data/models/product.dart';

class CategoryCardInfo extends StatelessWidget {
  const CategoryCardInfo({super.key, required this.product, this.onPressed});
  final Product product;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    product.pictureUrl ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManger.black.withAlpha(110),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        product.category ?? '',
                        style: AppStyle.text12bold.copyWith(
                          color: ColorsManger.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w, bottom: 10.h, right: 10.w),
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyle.text12bold.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                  Text(
                    product.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyle.text14Sbold,
                  ),
                  Row(
                    children: [
                      Text(
                        product.price.toString(),
                        style: AppStyle.text14Sbold,
                      ),
                      Text(
                        'EGP',
                        style: AppStyle.text10Semibold.copyWith(
                          color: ColorsManger.grey,
                        ),
                      ),
                      Spacer(),
                      CustomButton(
                        onPressed: onPressed,
                        shape: CircleBorder(),
                        buttonBackground: ColorsManger.primaryColor,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: ColorsManger.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
