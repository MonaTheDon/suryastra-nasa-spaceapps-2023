import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/constants.dart';
import 'package:magnetic_reconnection_space_app/features/home/screens/home_screen.dart';
import 'package:magnetic_reconnection_space_app/features/mr_daily_lives/screens/daily_lives_screen.dart';

int currentIndex = 0;

class MainScreen extends StatefulWidget {
  static const routeName = "/main-screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomeScreen(),
            DailyLives(),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Constants.navBarColor,
              selectedItemColor: Colors.purple.shade200,
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: currentIndex,
              selectedLabelStyle: TextStyle(fontSize: 12.sp),
              unselectedLabelStyle: TextStyle(fontSize: 12.sp),
              onTap: (i) {
                setState(() {
                  currentIndex = i;
                  log(currentIndex.toString());
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
