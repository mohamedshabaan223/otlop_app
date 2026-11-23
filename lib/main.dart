import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/cache/secure_storage.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/helper/app_bloc_observer.dart';
import 'package:otlop_app/core/route/route_constant.dart';
import 'package:otlop_app/core/route/route_generator.dart';
import 'package:otlop_app/feature/settings/presentation/cubits/cubit/settings_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  final token = await SecureStorage().getToken();
  debugPrint('token on start = $token');
  final bool isLogged = token != null && token.isNotEmpty;

  runApp(
    BlocProvider(
      create: (context) => SettingsCubit()..getTheme(),
      child: OtlopApp(isLogged: isLogged),
    ),
  );
}

class OtlopApp extends StatelessWidget {
  const OtlopApp({super.key, required this.isLogged});

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is ThemeSuccessState) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorsManger.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          final settingCubit = context.read<SettingsCubit>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: ColorsManger.backgroundColor,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: ColorsManger.white,
                selectedItemColor: ColorsManger.primaryColor,
                unselectedLabelStyle: AppStyle.text10MediumBottonnavigation,
                selectedLabelStyle: AppStyle.text10MediumBottonnavigation
                    .copyWith(color: ColorsManger.primaryColor),
              ),
              cardColor: ColorsManger.white,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: ColorsManger.background,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: ColorsManger.background,
                selectedItemColor: ColorsManger.primaryColor,
                unselectedLabelStyle: AppStyle.text10MediumBottonnavigation,
                selectedLabelStyle: AppStyle.text10MediumBottonnavigation
                    .copyWith(color: ColorsManger.primaryColor),
              ),
            ),
            themeMode: settingCubit.selectedTheme,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: isLogged
                ? RouteConstant.mainScreen
                : RouteConstant.loginScreen,
          );
        },
      ),
    );
  }
}
