import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Components/Buttons/social_login_button.dart';
import 'package:weather_app/Components/Constants/colors.dart';
import 'package:weather_app/Components/Constants/images.dart';
import 'package:weather_app/Components/Constants/svgs.dart';
import 'package:weather_app/Views/Auth/Login%20Screen/login_screen.dart';
import 'package:weather_app/Views/Auth/Signup%20Screens/signup_screen.dart';
import 'package:weather_app/Views/Home%20Screen/home_screen.dart';

class SignupExploreScreen extends StatefulWidget {
  const SignupExploreScreen({super.key});

  @override
  State<SignupExploreScreen> createState() => _SignupExploreScreenState();
}

class _SignupExploreScreenState extends State<SignupExploreScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }

  void _checkUserLoggedIn() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      User? user = _auth.currentUser;
      if (user != null) {
        // Navigate only after build completion
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            children: [
              Container(
                height: 697.h,
                width: 373.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: AppColors.greyColor),
                child: Column(
                  children: [
                    SizedBox(
                      height: 273.h,
                      width: 315.w,
                      child: Image.asset(AppImages.appIcon),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      'Explore the app',
                      style: TextStyle(
                          fontSize: 32.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'All your weather updates, in one place and \nunder control.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SocialLoginButtonx(
                            text: 'Continue with Google',
                            imgPath: AppSvgs.googleIcon,
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SocialLoginButtonx(
                            text: 'Continue with Email',
                            imgPath: AppSvgs.mailIcon,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?  ',
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.blackColor),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.blackColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
