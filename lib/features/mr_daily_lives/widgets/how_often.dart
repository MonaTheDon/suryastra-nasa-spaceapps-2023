import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/constants.dart';
import 'package:magnetic_reconnection_space_app/providers/daily_lives_provider.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets.dart';

class HowOften extends StatefulWidget {
  const HowOften({super.key});

  @override
  State<HowOften> createState() => _HowOftenState();
}

class _HowOftenState extends State<HowOften> {
  @override
  void initState() {
    super.initState();
  }

  void fetchData() {
    final dailyLivesProvider =
        Provider.of<DailyLivesProvider>(context, listen: false);

    if (dailyLivesProvider.month != "" && dailyLivesProvider.year != "") {
      dailyLivesProvider.getPlotForMonthYear(
          dailyLivesProvider.monthValueMap[dailyLivesProvider.month]!,
          int.parse(dailyLivesProvider.year));
    }
  }

  void fetchDataForYear() {
    final dailyLivesProvider =
        Provider.of<DailyLivesProvider>(context, listen: false);
    if (dailyLivesProvider.year != "") {
      dailyLivesProvider.getPlotForYear(int.parse(dailyLivesProvider.year));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dailyLivesProvider = Provider.of<DailyLivesProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 130.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: DropdownButton<String>(
                value: dailyLivesProvider.year == ""
                    ? dailyLivesProvider.years[0]
                    : dailyLivesProvider.year,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                iconSize: 24.sp,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                onChanged: (newValue) {
                  setState(() {
                    dailyLivesProvider.year = newValue!;
                  });
                  if (dailyLivesProvider.year != "") {
                    fetchDataForYear();
                  }
                  // if (dailyLivesProvider.month != "" &&
                  //     dailyLivesProvider.year != "") {
                  //   fetchData();
                  // }
                },
                items: dailyLivesProvider.years
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                hint: const Text("Select an Option"),
                isExpanded: true,
                underline: const SizedBox(),
                dropdownColor: Constants.navBarColor,
              ),
            ),
            Container(
              width: 130.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: DropdownButton<String>(
                value: dailyLivesProvider.month == ""
                    ? dailyLivesProvider.months[0]
                    : dailyLivesProvider.month,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                iconSize: 24.sp,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                onChanged: (newValue) {
                  setState(() {
                    dailyLivesProvider.month = newValue!;
                    if (dailyLivesProvider.month != "" &&
                        dailyLivesProvider.year != "") {
                      fetchData();
                    }
                  });
                },
                items: dailyLivesProvider.year == "2020"
                    ? dailyLivesProvider.months
                        .sublist(0, 9)
                        .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList()
                    : dailyLivesProvider.months
                        .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                hint: const Text("Select an Option"),
                isExpanded: true,
                underline: const SizedBox(),
                dropdownColor: Constants.navBarColor,
              ),
            ),
          ],
        ),
        verticalSpace(40.h),
        dailyLivesProvider.isFetchingData
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : (dailyLivesProvider.month != "" && dailyLivesProvider.year != "")
                ? Column(
                    children: [
                      Text(
                        dailyLivesProvider.magneticReconnectionValue.toString(),
                        style: TextStyle(
                          fontSize: 64.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(24.h),
                      Text(
                        "There were ${dailyLivesProvider.magneticReconnectionValue} magnetic reconnection in the ${dailyLivesProvider.month} of ${dailyLivesProvider.year}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(48.h),
                      Text(
                        "Here is how the graphs add up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 180.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                dailyLivesProvider.monthYearImageUrl),
                          ),
                        ),
                      ),
                      Text(
                        "Here's how the whole ${dailyLivesProvider.year} looked like with the magenetic reconnections",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      (dailyLivesProvider.yearImageUrl != "")
                          ? Container(
                              width: double.infinity,
                              height: 180.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      dailyLivesProvider.yearImageUrl),
                                ),
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white),
                    ],
                  )
                : const SizedBox(),
        verticalSpace(24.h),
      ],
    );
  }
}
