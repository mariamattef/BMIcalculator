import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculateButton extends StatelessWidget {
 final void Function()? onPressed ;

  const CalculateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50.h),
      ),
      onPressed: onPressed,
      child: Text("Calculate",
          style: TextStyle(fontSize: 18.sp, color: Colors.black)),
    );
  }
}
