import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Components/Buttons/logout_button.dart';
import 'package:weather_app/Components/Buttons/custom_search_bar.dart';
import 'package:weather_app/Components/Buttons/reusable_card.dart';
import 'package:weather_app/Components/Constants/colors.dart';
import 'package:weather_app/Components/Constants/images.dart';
import 'package:weather_app/Models/weather_api_model.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherData? weatherInfo;
  late String formattedDate;
  late String formattedTime;
  late Timer _timer;
  String cityName = "Chunian";
  final TextEditingController _controller = TextEditingController();

  void _updateTime() {
    setState(() {
      formattedDate = DateFormat('EEEE, d MMMM y').format(DateTime.now());
      formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  // Fetch weather data based on the city name
  void myWeather({required String city}) {
    WeatherService().fetchWeather(city).then(
      (value) {
        setState(() {
          weatherInfo = value;
        });
      },
    ).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load weather: $error')),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTime();
    });
    myWeather(city: cityName);
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: weatherInfo == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    WeatherDetails(
                      weather: weatherInfo!,
                      formattedDate: formattedDate,
                      formattedTime: formattedTime,
                      controller: _controller,
                      onSearch: (city) {
                        setState(() {
                          cityName = city;
                        });
                        myWeather(city: city);
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final WeatherData weather;
  final String formattedDate;
  final String formattedTime;
  final Function(String) onSearch;
  final TextEditingController controller;

  const WeatherDetails({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                CustomSearchBar(
                  onSearch: onSearch,
                  controller: controller,
                ),
                SizedBox(width: 10.w),
                const LogoutButton(),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          SizedBox(height: 75.h),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.whiteColor),
                      SizedBox(width: 10.w),
                      Text(
                        weather.name,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.whiteColor,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${weather.temperature.current.toStringAsFixed(2)} °C",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Row(
                    children: [
                      Lottie.asset(AppImages.clearImage, height: 50, width: 50),
                      SizedBox(width: 15.w),
                      Text(
                        weather.weather[0].main,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.whiteColor,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Lottie.asset(AppImages.cloudyImage, height: 150, width: 150)
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Lottie.asset(AppImages.windImage),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableCard(
                text: "${weather.wind.speed} km/h",
                icon: Icons.wind_power_outlined,
                value: 'Wind',
              ),
              ReusableCard(
                text: "${weather.maxTemperature} °C",
                icon: Icons.sunny,
                value: 'Max',
              ),
              ReusableCard(
                text: "${weather.minTemperature} °C",
                icon: Icons.sunny_snowing,
                value: 'Min',
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableCard(
                text: "${weather.humidity} %",
                icon: Icons.water_drop,
                value: 'Humidity',
              ),
              ReusableCard(
                text: "${weather.pressure} hPa",
                icon: Icons.air,
                value: 'Pressure',
              ),
              ReusableCard(
                text: "${weather.seaLevel} m",
                icon: Icons.water_rounded,
                value: 'Sea-Level',
              ),
            ],
          )
        ],
      ),
    );
  }
}
