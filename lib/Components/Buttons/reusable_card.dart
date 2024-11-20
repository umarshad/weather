import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Components/Constants/colors.dart';

class ReusableCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const ReusableCard(
      {super.key, required this.text, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 100,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.amber,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.backgroundColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
