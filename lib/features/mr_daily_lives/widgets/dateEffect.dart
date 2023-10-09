import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/common_widgets.dart';
import 'package:magnetic_reconnection_space_app/constants.dart';
import 'package:magnetic_reconnection_space_app/providers/daily_lives_provider.dart';
import 'package:provider/provider.dart';

class DateEffect extends StatefulWidget {
  const DateEffect({super.key});

  @override
  State<DateEffect> createState() => _DateEffectState();
}

class _DateEffectState extends State<DateEffect> {
  var dayController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();
  bool? isMR;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dayController.dispose();
    yearController.dispose();
    monthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dailyLivesProvider = Provider.of<DailyLivesProvider>(context);
    return Column(
      children: [
        const Text(
          "Input a date to figure out whether your date had a magnetic reconnection",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        verticalSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40.h,
              width: 70.w,
              child: TextField(
                cursorHeight: 25,
                cursorColor: Colors.white,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                controller: dayController,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  counter: const SizedBox(),
                  hintText: "DD",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
              width: 100.w,
              child: TextField(
                cursorHeight: 25,
                cursorColor: Colors.white,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                controller: monthController,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  counter: const SizedBox(),
                  hintText: "MM",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
              width: 100.w,
              child: TextField(
                cursorHeight: 25,
                cursorColor: Colors.white,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                controller: yearController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  counter: const SizedBox(),
                  hintText: "YYYY",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            if (dayController.text.isNotEmpty &&
                monthController.text.isNotEmpty &&
                yearController.text.isNotEmpty) {
              if (dayController.text.length == 1) {
                dayController.text = "0${dayController.text}";
              }
              if (monthController.text.length == 1) {
                monthController.text = "0${monthController.text}";
              }
              if (int.parse(yearController.text) < 1998 ||
                  int.parse(yearController.text) > 2020) {
                return;
              }
              var date =
                  "${yearController.text}-${monthController.text}-${dayController.text}";
              log(date);
              isMR = await dailyLivesProvider.checkMRonGivenDate(date);
              log("isMR in the build is $isMR");
            }
          },
          child: const Text("Let's Check!"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Constants.navBarColor,
            foregroundColor: Colors.white,
            elevation: 16,
          ),
        ),
        (dailyLivesProvider.isFetchingData3)
            ? const CircularProgressIndicator(color: Colors.white)
            : Column(
                children: [
                  verticalSpace(12.h),
                  if (isMR != null)
                    isMR!
                        ? const Text(
                            "Yes! There was a reconnection on the given date",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            "No! There was not a reconnection on the given date",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                ],
              )
      ],
    );
  }
}
