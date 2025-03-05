import 'package:calculator/modules/bmi_calculator/bmi_result_screen.dart';
import 'package:calculator/modules/widgets/age_weight_card.dart';
import 'package:calculator/modules/widgets/calculate_button.dart';
import 'package:calculator/modules/widgets/hight_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/gender_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;

  int age = 20;
  int height = 120;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = isMale ? Colors.blueAccent : Colors.pinkAccent;
    Color secondaryColor = isMale ? Colors.blue.shade700 : Colors.pink.shade700;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 3,
        title: Text("BMI Calculator"),
        backgroundColor: secondaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderCard(
                    label: "Male",
                    icon: Icons.male,
                    isSelected: isMale,
                    onTap: () => setState(() => isMale = true),
                  ),
                  GenderCard(
                    label: "Female",
                    icon: Icons.female,
                    isSelected: !isMale,
                    onTap: () => setState(() => isMale = false),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              HightSlider(
                activeColor: primaryColor,
                height: height.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    height = value.toInt();
                  });
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AgeWeightCard(
                      label: "Age",
                      value: age,
                      onMinus: () => age <= 1 ? age = 1 : setState(() => age--),
                      onPlus: () => setState(() => age++)),
                  AgeWeightCard(
                      label: "Weight",
                      value: weight,
                      onMinus: () {
                        weight <= 10 ? weight = 10 : setState(() => weight--);
                      },
                      onPlus: () => setState(() => weight++)),
                ],
              ),
              SizedBox(height: 20.h),
              CalculateButton(
                onPressed: () {
                  double bmi = weight / ((height / 100) * (height / 100));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                        isMale: isMale,
                        height: height,
                        weight: weight,
                        bmiResult: bmi,
                      ),
                    ),
                  );

                  // Navigator.pushNamed(context, '/bmi_result');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
