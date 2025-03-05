import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BMIResultScreen extends StatelessWidget {
  final bool isMale;
  final int height;
  final int weight;
  final double bmiResult;

  const BMIResultScreen({
    super.key,
    required this.isMale,
    required this.height,
    required this.weight,
    required this.bmiResult,
  });

  String getResultCategory() {
    if (bmiResult < 18.5) {
      return "Underweight 😔";
    } else if (bmiResult < 24.9) {
      return "Normal 😊";
    } else if (bmiResult < 29.9) {
      return "Overweight 😕";
    } else {
      return "Obese 😟";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isMale ? Colors.blue[100] : Colors.pink[100],
      appBar: AppBar(
        title: const Text("BMI Result"),
        backgroundColor: isMale ? Colors.blueAccent : Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isMale ? Icons.male : Icons.female,
                  size: 80.sp,
                  color: Colors.white,
                ),
                Text(
                  isMale ? "Male" : "Female",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                infoRow("Height", "$height cm"),
                infoRow("Weight", "$weight kg"),
                infoRow("BMI", bmiResult.toStringAsFixed(1)),
                SizedBox(height: 12.h),
                Text(
                  getResultCategory(),
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: Size(120.w, 40.h),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18.sp, color: Colors.white)),
          Text(value,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
