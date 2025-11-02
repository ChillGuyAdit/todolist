import 'package:flutter/material.dart';
import 'package:todolist/pages/helper.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().putih,
      body: Align(
        alignment: AlignmentGeometry.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('image/primerLogo.jpg', width: 291, height: 291),
            SizedBox(height: 40),
            Text(
              'Sederhanakan, Atur, dan',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: AppColor().hitam,
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kuasai',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: AppColor().hitam,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Hari Kamu',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColor().primer,
                  ),
                ),
              ],
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
