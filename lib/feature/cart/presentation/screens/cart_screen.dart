import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/feature/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:otlop_app/feature/cart/data/models/cart_model.dart';
import 'package:otlop_app/feature/cart/presentation/widgets/cart_header.dart';
import 'package:otlop_app/feature/cart/presentation/widgets/cart_item.dart';
import 'package:otlop_app/feature/cart/presentation/widgets/order_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartModel> cartList = [];
  int? counter;
  double total = 0;
  CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource();
  @override
  void initState() {
    super.initState();
    cartRemoteDataSource.getCart().then((value) {
      cartList = value;
      for (CartModel element in cartList) {
        total += element.price * element.quantity;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                CartHeader(total: total),
                SizedBox(height: 20.h),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) => CartItem(
                    onPressedAdd: () {},
                    counter: counter ?? 0,
                    onPressedRemove: () {},
                    productName: cartList[index].name,
                    imagePath: cartList[index].image,
                    brand: cartList[index].brand,
                    category: cartList[index].category,
                    price: cartList[index].price.toString(),
                  ),
                ),
                SizedBox(height: 20.h),
                OrderSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
