import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/home/presentation/cubit/category_barnd_cubit/category_brand_cubit.dart';
import 'package:otlop_app/feature/home/presentation/widgets/brand_item_card.dart';
import 'package:otlop_app/feature/home/presentation/widgets/category_header.dart';
import 'package:otlop_app/feature/home/presentation/widgets/category_item_card.dart';
import 'package:otlop_app/feature/home/presentation/widgets/custrom_slide.dart';
import 'package:otlop_app/feature/home/presentation/widgets/home_get_product.dart';
import 'package:otlop_app/feature/home/presentation/widgets/home_header.dart';
import 'package:otlop_app/feature/home/presentation/widgets/search_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(),
                SearchSection(hintText: 'Search coffee, cakes, donuts...'),
                SizedBox(height: 20),
                CustomSlide(),
                SizedBox(height: 20),
                CategoryHeader(),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 99.h,
                  child: BlocBuilder<CategoryBrandCubit, CategoryBrandState>(
                    buildWhen: (previous, current) =>
                        current is CategorySuccessState ||
                        current is CategoryLoadingState ||
                        current is CategoryErrorState,
                    builder: (context, state) {
                      if (state is CategoryLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManger.primaryColor,
                          ),
                        );
                      } else if (state is CategorySuccessState) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => FilterCategoryScreen(
                              //       id: category[index]['id'] ?? 0,
                              //       name: category[index]['name'],
                              //     ),
                              //   ),
                              // );
                            },
                            child: CategoryItemCard(
                              categoryModel: state.categories[index],
                            ),
                          ),
                        );
                      } else if (state is CategoryErrorState) {
                        return Text(state.errorMessage);
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Text('Brands', style: AppStyle.text18Bold),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 40.h,
                  child: BlocBuilder<CategoryBrandCubit, CategoryBrandState>(
                    buildWhen: (previous, current) =>
                        current is BrandSuccessState ||
                        current is BrandLoadingState ||
                        current is BrandErrorState,
                    builder: (context, state) {
                      if (state is BrandLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManger.primaryColor,
                          ),
                        );
                      } else if (state is BrandSuccessState) {
                        return ListView.builder(
                          itemCount: state.brands.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => FilterBrandScreen(
                              //       id: brand[index]['id'],
                              //       name: brand[index]['name'],
                              //     ),
                              //   ),
                              // );
                            },
                            child: BrandItemCard(label: state.brands[index]),
                          ),
                        );
                      } else if (state is BrandErrorState) {
                        return Text(state.errorMessage);
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Text('Popular right now', style: AppStyle.text18Bold),
                SizedBox(height: 15.h),
                HomeGetProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
