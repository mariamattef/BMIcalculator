import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onTap;
  final bool isSelected;

  const GenderCard({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
    required this.isSelected,
  });

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 80.sp, color: isSelected ? Colors.black : Colors.grey),
            SizedBox(height: 10.h),
            Text(label, style: TextStyle(color: Colors.black, fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
