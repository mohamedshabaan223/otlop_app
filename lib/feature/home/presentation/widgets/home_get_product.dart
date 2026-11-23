import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/route/route_constant.dart';
import 'package:otlop_app/feature/home/data/models/product.dart';
import 'package:otlop_app/feature/home/presentation/cubit/category_barnd_cubit/category_brand_cubit.dart';
import 'package:otlop_app/feature/home/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:otlop_app/feature/home/presentation/cubit/product_cubit/product_state.dart';
import 'package:otlop_app/feature/home/presentation/widgets/category_card_info.dart';

class HomeGetProduct extends StatelessWidget {
  const HomeGetProduct({super.key, this.catId, this.brandId});
 final int? catId , brandId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBrandCubit, CategoryBrandState>(
      listener: (context, state) {
        if (state is CartLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => CircularProgressIndicator(),
          );
        } else if (state is CartSuccessState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.lightGreen,
              content: Text('PRODUCT ADDED SUCCESSFULY'),
            ),
          );
        } else if (state is CartErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        } else {
          SizedBox.shrink();
        }
      },
      builder: (context, state) {
        return BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsManger.primaryColor,
                ),
              );
            } else if (state is ProductSuccessState) {
              final List<Product> products = state.productList;
              if (state.productList.isEmpty) {
                return Text('List is empty');
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.64,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteConstant.categoryDetailsScreen,
                    );
                  },
                  child: CategoryCardInfo(
                    onPressed: () {
                      BlocProvider.of<CategoryBrandCubit>(context).addCart(
                        productId:products[index].id ?? 0,
                        quantity: 1,
                      );
                    },
                    product:products[index],
                  ),
                ),
              );
            } else if (state is ProductErrorState) {
              return Text(state.errorMessage);
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
