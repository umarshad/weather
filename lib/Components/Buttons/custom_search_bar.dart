import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Components/Constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearch;
  final TextEditingController controller;

  const CustomSearchBar({
    super.key,
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(12),
            hintText: 'Search City',
            hintStyle: TextStyle(
                fontSize: 16.sp, color: AppColors.blackColor.withOpacity(0.5)),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.blackColor.withOpacity(0.5),
              size: 25.sp,
            ),
          ),
          onSubmitted: (value) {
            onSearch(value);
            controller.clear();
          },
        ),
      ),
    );
  }
}
