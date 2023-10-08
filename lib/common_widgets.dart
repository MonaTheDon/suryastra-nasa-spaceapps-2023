// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

class TextContainer extends StatelessWidget {
  final String containerText;
  const TextContainer({
    Key? key,
    required this.containerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        containerText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
