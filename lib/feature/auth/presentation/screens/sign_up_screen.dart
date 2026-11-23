import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/helper/validator_app.dart';
import 'package:otlop_app/core/route/route_constant.dart';
import 'package:otlop_app/core/widgets/custom_elevetedbutton.dart';
import 'package:otlop_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:otlop_app/feature/auth/data/models/register_request.dart';
import 'package:otlop_app/feature/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/auth_info.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/custom_social.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/forget_password_row.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/have_account.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/header_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  final GlobalKey<FormState> key = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    HeaderAuth(
                      title: 'Create an account',
                      subTitile: 'Connect with your friends today!',
                    ),
                    SizedBox(height: 40.h),
                    AuthInfo(
                      label: 'Name',
                      validator: ValidatorApp.validateName,
                      controller: name,
                      hintText: 'Enter Your Name',
                    ),
                    SizedBox(height: 15.h),
                    AuthInfo(
                      label: 'Email​ Address',
                      controller: email,
                      validator: ValidatorApp.validateEmail,
                      hintText: 'Enter Your Email',
                    ),
                    SizedBox(height: 15.h),
                    AuthInfo(
                      label: 'Phone Number',
                      validator: ValidatorApp.validatePhoneNumber,
                      controller: phoneNumber,
                      hintText: 'Enter Your Phone',
                    ),
                    SizedBox(height: 15.h),
                    AuthInfo(
                      label: 'Password',
                      controller: password,
                      validator: ValidatorApp.validatePassword,
                      hintText: ' Please Enter Your Password',
                      suffix: Icon(Icons.remove_red_eye),
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
                              content: Text('REGISTER SUCCESSED'),
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
                            BlocProvider.of<AuthCubit>(context).register(
                              register: RegisterRequest(
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                phoneNumber: phoneNumber.text,
                              ),
                            );
                          },
                          fixedSize: Size(double.infinity, 45.h),
                          radius: 10,
                          child: Text(
                            'Sign Up',
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
                      label: 'Already have an account ?',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteConstant.loginScreen,
                        );
                      },
                      child: Text(
                        'Login',
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
        ),
      ),
    );
  }
}
