import 'package:flutter/material.dart';
import 'package:todolist/theme/helper.dart';
import 'package:todolist/pages/signUp.dart';

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
      body: Stack(
        children: [
          Align(
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
                    fontSize: 35,
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
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hari Kamu',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: AppColor().primer,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Kuasai dan atur semua pekerjaanmu dan',
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
                Text(
                  'Capai segala impianmu',
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: AppColor().primer,
                ),
                child: Text(
                  'Lets Start',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor().putih,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => signUp()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
