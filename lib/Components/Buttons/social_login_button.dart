import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Components/Constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButtonx extends StatelessWidget {
  final String text;
  final String imgPath;
  final VoidCallback onPressed;
  const SocialLoginButtonx(
      {super.key,
      required this.text,
      required this.imgPath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 54.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.outlineColor),
            borderRadius: BorderRadius.circular(35.r),
            color: AppColors.whiteColor),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.w)),
            SvgPicture.asset(imgPath),
            SizedBox(
              width: 30.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
