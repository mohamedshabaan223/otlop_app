import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/core/route/route_constant.dart';
import 'package:otlop_app/feature/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:otlop_app/feature/auth/presentation/screens/sign_in_screen.dart';
import 'package:otlop_app/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:otlop_app/feature/cart/presentation/screens/cart_screen.dart';
import 'package:otlop_app/feature/home/presentation/screens/category_details_screen.dart';
import 'package:otlop_app/feature/home/presentation/screens/filter_product_screen.dart';
import 'package:otlop_app/feature/home/presentation/screens/home_screen.dart';
import 'package:otlop_app/feature/main/main_screen.dart';
import 'package:otlop_app/feature/settings/presentation/screens/settings_screen.dart';

class RouteGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignUpScreen(),
          ),
        );
      case RouteConstant.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignInScreen(),
          ),
        );
      case RouteConstant.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstant.categoryDetailsScreen:
        return MaterialPageRoute(builder: (_) => CategoryDetailsScreen());
      case RouteConstant.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case RouteConstant.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RouteConstant.filterProductScreen:
        return MaterialPageRoute(builder: (_) => FilterProductScreen());
      case RouteConstant.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('Route Not Founded'))),
        );
    }
  }
}
