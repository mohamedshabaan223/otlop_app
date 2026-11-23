import 'package:flutter/material.dart';
import 'package:otlop_app/core/colors_manger.dart';
import 'package:otlop_app/feature/home/presentation/widgets/select_location.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good evening 🥐'),

                Text(
                  'Alex',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Stack(
                children: [
                  Icon(Icons.notifications_none, size: 30),
                  Positioned(
                    left: 18,
                    top: 3,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorsManger.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        InkWell(onTap: () {}, child: SelectLocation()),
        SizedBox(height: 15),
      ],
    );
  }
}
