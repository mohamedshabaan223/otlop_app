import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/images_mangers.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';
import 'package:otlop_app/core/widgets/custom_conter.dart';
import 'package:otlop_app/feature/home/presentation/widgets/custom_container.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: Image.asset(
                  ImagesMangers.categoryDetailsImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 55,
                left: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManger.black.withAlpha(140),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorsManger.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomContainer(
                      text: 'Cilantro',
                      containerColor: ColorsManger.primaryColor.withAlpha(40),
                      textColor: ColorsManger.primaryColor,
                    ),
                    SizedBox(width: 15.w),
                    CustomContainer(
                      text: 'Donuts',
                      containerColor: ColorsManger.grey.withAlpha(40),
                      textColor: ColorsManger.grey,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text('Glazed Donuts', style: AppStyle.text36Extrbold),
                Row(
                  children: [
                    Text(
                      '180 ',
                      style: AppStyle.text36Extrbold.copyWith(
                        color: ColorsManger.primaryColor,
                      ),
                    ),
                    Text(
                      'EGP',
                      style: AppStyle.text14Sbold.copyWith(
                        color: ColorsManger.grey,
                      ),
                    ),
                  ],
                ),
                Divider(color: ColorsManger.grey, height: 40.h),
                Text(
                  'ABOUT THIS ITEM',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.text11Semibold.copyWith(
                    color: Color(0xff9CA3AF),
                  ),
                ),
                SizedBox(height: 11.h),
                Text(
                  'Classic ring donuts hand-dipped in a signature\nsugar glaze while still warm from the fryer.\nLight, pillowy and irresistibly sweet.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.text15Regular.copyWith(
                    color: ColorsManger.grey,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Row(
              children: [
                CustomCounter(
                  raduis: 10.r,
                  onPressedAdd: () {
                    if (counter >= 0) {
                      counter++;
                      setState(() {});
                    }
                  },
                  counter: counter,
                  onPressedRemove: () {
                    if (counter > 0) {
                      counter--;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(width: 10.w),
                CustomButton(
                  onPressed: () {},
                  buttonBackground: ColorsManger.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0.w,
                      vertical: 17.h,
                    ),
                    child: Text(
                      'Add to cart · 180 EGP',
                      style: AppStyle.text15Bold.copyWith(
                        color: ColorsManger.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
