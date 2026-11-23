import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/feature/cart/presentation/screens/cart_screen.dart';
import 'package:otlop_app/feature/home/presentation/cubit/category_barnd_cubit/category_brand_cubit.dart';
import 'package:otlop_app/feature/home/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:otlop_app/feature/home/presentation/screens/home_screen.dart';
import 'package:otlop_app/feature/settings/presentation/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Widget> tabs = [
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ProductCubit()..getProduct()),
      BlocProvider(
        create: (_) => CategoryBrandCubit()
          ..getCategories()
          ..getBrand(),
      ),
    ],
    child: HomeScreen(),
  ),
  CartScreen(),
  Scaffold(body: Center(child: Text('profile'))),
  SettingsScreen(),
];
int currentIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/cart.png')),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/profile.png')),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
