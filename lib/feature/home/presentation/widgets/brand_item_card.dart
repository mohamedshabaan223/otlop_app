import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/settings/presentation/cubits/cubit/settings_cubit.dart';

class BrandItemCard extends StatelessWidget {
  const BrandItemCard({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = context.read<SettingsCubit>();
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: settingsCubit.isDark
            ? ColorsManger.surfaceVariant
            : ColorsManger.white,
      ),
      child: Text(label, style: AppStyle.text14Sbold),
    );
  }
}
