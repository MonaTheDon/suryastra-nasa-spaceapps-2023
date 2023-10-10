import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/common_widgets.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Frequency and Spectral Analysis of Z component of IMF vectors",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(20.h),
              Text(
                "IMF Variation Over Time: ACE, WIND, DSCOVR Z-Component",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/spectralanalysis_1.png'),
              ),
              verticalSpace(15.h),
              const TextContainer(
                  containerText:
                      "Here are some additional insights that can be drawn from the graph:\n\n 1. The Bz component of the IMF tends to be more negative during periods of high solar activity, such as the solar maximum.\n 2. The Bz component of the IMF can also be affected by coronal mass ejections (CMEs), which are large clouds of plasma that are ejected from the Sun.\n 3. The Bz component of the IMF can be used to predict geomagnetic storms. A southward-oriented IMF is more likely to lead to a geomagnetic storm than a northward-oriented."),
              //2nd Pic
              verticalSpace(20.h),
              Text(
                "Temporal Variation of IMF Z-Component by DSCOVR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/spectralanalysis_2.png'),
              ),
              verticalSpace(15.h),
              const TextContainer(
                  containerText:
                      "The Z component is a measure of the strength of the magnetic field in the solar wind. \nThe graph shows that the Z component is strongest at times when the sun is active, such as during solar flares and coronal mass ejections. The Z component is weakest at times when the sun is quiet. This variability can have a significant impact on the Earth's magnetic field, and can lead to geomagnetic storms."),
              verticalSpace(20.h),
              Text(
                "PSD of ACE Satellite's IMF Bz Component",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/spectralanalysis_3.png'),
              ),
              verticalSpace(15.h),
              const TextContainer(
                  containerText:
                      "The power is concentrated at low frequencies.\nHere are some specific insights that can be obtained from the PSD graph:\n\n 1. The peak in power at low frequencies indicates that the Bz component of the IMF is dominated by large-scale structures, such as CMEs and CIRs.\n 2. The peak in power at around 0.1 cycles per day is likely due to the Earth's rotation.\n 3. The decrease in power at higher frequencies is due to the fact that the IMF is turbulent.\n 4. The overall shape of the PSD graph can be used to identify different types of IMF disturbances, such as CMEs, CIRs, and solar wind streams.\n 4. The PSD graph can also be used to predict the likelihood of geomagnetic storms.\n\n The PSD graph is a valuable tool for understanding the IMF and its impact on the Earth's environment."),
              verticalSpace(20.h),
              Text(
                "Frequency Analysis of WIND Satellite's IMF Z-Component",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/spectralanalysis_4.png'),
              ),
              verticalSpace(15.h),
              const TextContainer(
                  containerText:
                      "The frequency of the Z component of IMF vectors has been increasing over time. The graph also shows that the amplitude of the Z component of IMF vectors has been increasing over time, but at a slower rate than the frequency.Here are some specific insights that can be obtained from the graph:\n\n 1. The increasing frequency of the Z component of IMF vectors suggests that the Earth's magnetic field is weakening or that the solar cycle is becoming more active.\n 2. The increasing amplitude of the Z component of IMF vectors suggests that the IMF is becoming more variable.\n 3. The increasing variability of the IMF could lead to more frequent and intense geomagnetic storms, which could have a number of implications for the Earth's environment.")
            ],
          ),
        ),
      ),
    );
  }
}
