import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/route/route_constant.dart';
import 'package:otlop_app/core/widgets/custom_elevetedbutton.dart';
import 'package:otlop_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:otlop_app/feature/auth/data/models/login_request.dart';
import 'package:otlop_app/feature/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/auth_info.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/custom_social.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/forget_password_row.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/have_account.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/header_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                HeaderAuth(
                  title: 'Hi, Wecome Back! 👋',
                  subTitile: 'Hello again, you’ve been missed!',
                ),
                SizedBox(height: 30.h),
                AuthInfo(
                  label: 'Email',
                  controller: email,
                  hintText: 'Enter Your Email',
                ),
                SizedBox(height: 15.h),
                AuthInfo(
                  label: 'Password',
                  controller: password,
                  hintText: 'Enter Your Password Please',
                ),
                SizedBox(height: 20.h),
                ForgetPasswordRow(),
                SizedBox(height: 20.h),
                BlocConsumer<AuthCubit, AuthCubitState>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      Center(
                        child: CircularProgressIndicator(
                          color: ColorsManger.primaryColor,
                        ),
                      );
                    } else if (state is AuthSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.lightGreen,
                          content: Text('LOGIN SUCCESSED'),
                        ),
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        RouteConstant.mainScreen,
                      );
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errMessage),
                        ),
                      );
                    } else {
                      SizedBox.shrink();
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CustomElevetedbutton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).login(
                          login: LoginRequest(
                            email: email.text,
                            password: password.text,
                          ),
                        );
                      },
                      fixedSize: Size(double.infinity, 45.h),
                      radius: 10,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                          color: ColorsManger.white,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15.h),

                CustomSocial(),
                HaveAccount(
                  label: 'Don’t have an account ? ',
                  onPressed: () {
                    authRemoteDataSource.login(
                      login: LoginRequest(
                        email: email.text,
                        password: password.text,
                      ),
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      RouteConstant.registerScreen,
                    );
                  },
                  child: Text(
                    'Sign',
                    style: AppStyle.text14Sbold.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
