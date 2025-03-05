import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightSlider extends StatelessWidget {
  final double height;
  final Color? activeColor;
  final void Function(double value) onChanged;

  const HightSlider({super.key, required this.height, required this.onChanged, this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text("Height",
              style: TextStyle(color: Colors.black, fontSize: 18.sp)),
          SizedBox(height: 8.h),
          Text("${height.toInt()} cm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold)),
          Slider(
            value: height,
            min: 50,
            max: 200,
            onChanged: onChanged,
            activeColor:activeColor,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
