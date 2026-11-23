import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otlop_app/core/images_mangers.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/divider_row.dart';
import 'package:otlop_app/feature/auth/presentation/widgets/gitlab_github_button.dart';

class CustomSocial extends StatelessWidget {
  const CustomSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerRow(),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GitlabGithubButton(
              imagePath: ImagesMangers.githubImagePath,
              label: 'GitHub',
            ),
            SizedBox(width: 13.w),
            GitlabGithubButton(
              imagePath: ImagesMangers.gitlabImagePath,
              label: 'GitLab',
            ),
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
