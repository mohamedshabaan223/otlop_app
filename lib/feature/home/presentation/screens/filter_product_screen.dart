import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/home/presentation/widgets/container_filter.dart';
import 'package:otlop_app/feature/home/presentation/widgets/filter_search.dart';
import 'package:otlop_app/feature/home/presentation/widgets/header_filters.dart';
import 'package:otlop_app/feature/home/presentation/widgets/home_get_product.dart';

class FilterProductScreen extends StatelessWidget {
  FilterProductScreen({super.key, this.name, this.catId, this.brandId});
  final String? name;
  final int? catId, brandId;

  List<String> labels = ['Relevance', 'Price ↑', 'Price ↓', 'A – Z'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                HeaderFilters(label: name ?? ''),
                SizedBox(height: 12.h),
                FilterSearch(hintText: 'Search products...'),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 40.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ContainerFilter(
                          label: 'Relevance',
                          containerColor: ColorsManger.primaryColor,

                          labelColor: ColorsManger.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ContainerFilter(
                          label: 'Price ↑',
                          containerColor: ColorsManger.white,
                          labelColor: ColorsManger.black,
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: ContainerFilter(
                          label: 'Price ↓',
                          containerColor: ColorsManger.white,
                          labelColor: ColorsManger.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ContainerFilter(
                          label: 'A – Z',
                          containerColor: ColorsManger.white,
                          labelColor: ColorsManger.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '2items',
                  style: AppStyle.text12Semibold.copyWith(
                    color: Color(0xff9CA3AF),
                  ),
                ),
                SizedBox(height: 16.h),
                HomeGetProduct(catId: catId ?? null, brandId:  brandId ?? null, ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
