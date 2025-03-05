import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeWeightCard extends StatelessWidget {
  final String label;
  final int value;
  final void Function()? onMinus;
  final void Function()? onPlus;
  const AgeWeightCard({super.key, required this.label, required this.value, this.onMinus, this.onPlus,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(color: Colors.black, fontSize: 18.sp)),
          SizedBox(height: 8.h),
          Text("$value",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: onMinus,
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: onPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
