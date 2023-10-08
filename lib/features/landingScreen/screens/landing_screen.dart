import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/common_widgets.dart';
import 'package:magnetic_reconnection_space_app/constants.dart';
import 'package:magnetic_reconnection_space_app/features/home/screens/main_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gifs/NightSky.gif"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            verticalSpace(114.h),
            Text(
              "Harmony of the Cosmos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(24.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Exploring Magnetic Reconnection in Space Weather",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            verticalSpace(98.w),
            SizedBox(
              width: 160.w,
              height: 40.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.buttonColor),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MainScreen.routeName);
                  },
                  child: Text(
                    "Begin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
