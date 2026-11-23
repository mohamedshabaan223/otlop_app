import 'package:flutter/material.dart';
import 'package:otlop_app/core/app_style.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/core/widgets/custom_button.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: ColorsManger.black,
          activeColor: Colors.white,
          side: BorderSide(color: ColorsManger.grey, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          ),
          value: false,
          onChanged: (value) {},
        ),
        Text('Remember Me', style: AppStyle.text14Semibold),
        Spacer(),
        CustomButton(
          onPressed: () {},
          child: Text(
            'Forgot Password',

            style: AppStyle.text14Semibold.copyWith(
              color: ColorsManger.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
