import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Components/Constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.textStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular(10),
            color: buttonColor),
        child: Center(
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}
