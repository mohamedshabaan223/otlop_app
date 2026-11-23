import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';

class GitlabGithubButton extends StatelessWidget {
  const GitlabGithubButton({
    super.key,
    required this.imagePath,
    required this.label,
  });
  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManger.grey2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(imagePath),
          SizedBox(width: 12.w),
          Text(label, style: AppStyle.text14Semibold),
        ],
      ),
    );
  }
}
