import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/feature/home/data/models/category_model/category_model.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Card(
                // color: ColorsManger.white,
                child: Image.network(categoryModel.pictureUrl ?? ''),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(categoryModel.name ?? '', style: AppStyle.text12Semibold),
        ],
      ),
    );
  }
}
