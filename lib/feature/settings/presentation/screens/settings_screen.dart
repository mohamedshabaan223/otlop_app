import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/settings/data/models/language.dart';
import 'package:otlop_app/feature/settings/presentation/cubits/cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'اللغه العربيه', code: 'ar'),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = context.read<SettingsCubit>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Settings Screen',
                    style: AppStyle.text25Semibold.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Theme',
                    style: AppStyle.text30ExtrBold.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return Switch(
                        value: settingsCubit.selectedTheme == ThemeMode.dark,
                        activeThumbColor: ColorsManger.white,
                        activeTrackColor: ColorsManger.primaryColor,
                        inactiveThumbColor: ColorsManger.primaryColor,
                        onChanged: (isDark) {
                          settingsCubit.changeTheme(
                            isDark ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Languages',
                    style: AppStyle.text30ExtrBold.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: ColorsManger.primaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Language>(
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        iconEnabledColor: ColorsManger.white,
                        focusColor: ColorsManger.primaryColor,
                        dropdownColor: ColorsManger.primaryColor,
                        style: AppStyle.text18Bold,
                        value: languages.first,
                        items: languages
                            .map(
                              (laguage) => DropdownMenuItem<Language>(
                                value: laguage,
                                child: Text(laguage.name),
                              ),
                            )
                            .toList(),
                        onChanged: (selectedLanguage) {},
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
