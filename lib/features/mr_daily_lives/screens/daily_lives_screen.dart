import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/common_widgets.dart';
import 'package:magnetic_reconnection_space_app/features/mr_daily_lives/widgets/how_often.dart';

class DailyLives extends StatefulWidget {
  const DailyLives({super.key});

  @override
  State<DailyLives> createState() => _DailyLivesState();
}

class _DailyLivesState extends State<DailyLives> {
  String selectedValue = "Option 1";
  bool _isHowOftenSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(32.h),
              Text(
                "Magnetic Reconnection in our Daily Lives?",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              verticalSpace(24.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isHowOftenSelected = false;
                      });
                    },
                    child: Container(
                      width: 160.w,
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isHowOftenSelected
                            ? Colors.white.withOpacity(0.4)
                            : Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "When did it occur?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isHowOftenSelected = true;
                      });
                    },
                    child: Container(
                      width: 160.w,
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isHowOftenSelected
                            ? Colors.white.withOpacity(0.7)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "How often?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpace(36.h),
              _isHowOftenSelected ? const HowOften() : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
