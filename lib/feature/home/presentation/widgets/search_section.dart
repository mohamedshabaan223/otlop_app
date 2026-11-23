import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/images_mangers.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';
import 'package:otlop_app/feature/settings/presentation/cubits/cubit/settings_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = context.read<SettingsCubit>();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hint: Text(
                hintText,
                style: AppStyle.text24Regular.copyWith(
                  color: settingsCubit.isDark
                      ? ColorsManger.white
                      : ColorsManger.grey,
                ),
              ),
              filled: true,
              fillColor: settingsCubit.isDark
                  ? ColorsManger.surfaceVariant
                  : ColorsManger.white,
              prefixIcon: Icon(
                Icons.search,
                color: settingsCubit.isDark ? ColorsManger.white : Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        CustomButton(
          onPressed: () {},
          shape: CircleBorder(),
          buttonBackground: settingsCubit.isDark
              ? ColorsManger.surfaceVariant
              : ColorsManger.white,
          child: SvgPicture.asset(ImagesMangers.continerPath),
        ),
      ],
    );
  }
}
