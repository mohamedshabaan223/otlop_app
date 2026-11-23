import 'package:flutter/material.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlide extends StatelessWidget {
  CustomSlide({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: 355,
      // height: 155,
      decoration: BoxDecoration(
        color: ColorsManger.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withAlpha(100),
            ),
            child: Text(
              'Limited offer',
              style: TextStyle(
                color: ColorsManger.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Free delivery on \nyour first order',
            style: TextStyle(
              color: ColorsManger.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Use code BITE10 at checkout',
            style: TextStyle(
              color: ColorsManger.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: AlignmentGeometry.centerEnd,
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                activeDotColor: ColorsManger.white,
                dotColor: Colors.white.withAlpha(100),
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
          ),
        ],
      ),
    );
  }
}
