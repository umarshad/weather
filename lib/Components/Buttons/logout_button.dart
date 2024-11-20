import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/Components/Constants/colors.dart';
import 'package:weather_app/Views/Auth/Login%20Screen/login_screen.dart';
import 'package:weather_app/Components/Utils/utils.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      
      await FirebaseAuth.instance.signOut();

     
      Utils().toastMessage("Logged out successfully!");

  
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      Utils().toastMessage("Error during logout: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _logout(context),
      child: Container(
        height: 50.h,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.logout),
      ),
    );
  }
}
