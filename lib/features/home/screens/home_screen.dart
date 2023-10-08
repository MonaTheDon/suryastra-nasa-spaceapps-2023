import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20.h),
            Text(
              "What is Magnetic Reconnection?",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            verticalSpace(24.h),
            const TextContainer(
                containerText:
                    "Magnetic reconnection in Earth's space weather is a captivating dance between the sun's magnetic field and our own. Imagine a celestial tango where magnetic lines from the sun and Earth intermingle, creating dazzling displays of energy. The frequency of these cosmic choreographies is influenced by the sun's activity, following an intricate rhythm that scientists keenly observe."),
            verticalSpace(34.h),
            Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                    image: AssetImage("assets/gifs/magnetic_reconnection.gif"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: Text(
                "Source: NASA",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            verticalSpace(34.h),
            const TextContainer(
                containerText:
                    "At the heart of magnetic reconnection lies a cosmic paradox: the breaking and mending of magnetic connections. It's a cosmic reset button, allowing energy to be transformed and redistributed, influencing space weather patterns and impacting our technological infrastructure. Scientists keenly study this celestial pas de deux to unravel the secrets of our solar system's magnetic intricacies."),
            verticalSpace(34.h),
            Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                    image: AssetImage("assets/gifs/81u7au.gif"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: Text(
                "Source: NASA",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            verticalSpace(34.h),
            const TextContainer(
                containerText:
                    "These magnetic dances are not exclusive to Earth; they are cosmic occurrences shaping the behavior of stars, planets, and other celestial bodies. As we delve deeper into the mysteries of magnetic reconnection, we gain a better understanding of the cosmic rhythms that govern the vastness of space."),
            verticalSpace(34.h),
          ],
        ),
      ),
    ));
  }
}
