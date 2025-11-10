import 'package:flutter/material.dart';
import 'package:todolist/theme/helper.dart';
import 'package:todolist/pages/fillTask.dart';
import 'package:todolist/pages/allTask.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  bool _Click = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor().putih,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.search_outlined, size: 30),
                    hint: Text(
                      'Searrch for Task, Event',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey.withOpacity(1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.06),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColor().hitam,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: AppColor().putih,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fillTask()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Container(
                            height: 100,
                            width: 120,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor().primer),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.work_outline,
                                  color: AppColor().primer,
                                  size: 30,
                                ),
                                Text(
                                  'Work',
                                  style: TextStyle(
                                    color: AppColor().primer,
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: AppColor().putih,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fillTask()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Container(
                            height: 100,
                            width: 120,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor().orange),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: AppColor().orange,
                                  size: 30,
                                ),
                                Text(
                                  'Personal',
                                  style: TextStyle(
                                    color: AppColor().orange,
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: AppColor().putih,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fillTask()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor().kuning),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: AppColor().kuning,
                                  size: 30,
                                ),
                                Text(
                                  'Shopping',
                                  style: TextStyle(
                                    color: AppColor().kuning,
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      color: AppColor().putih,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fillTask()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Container(
                            height: 100,
                            width: 120,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFF5722).withOpacity(0.6),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Color(0xFFFF5722).withOpacity(0.6),
                                  size: 30,
                                ),
                                Text(
                                  'Healing',
                                  style: TextStyle(
                                    color: Color(0xFFFF5722).withOpacity(0.6),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: screenWidth * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Todays's task",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor().hitam,
                      fontFamily: 'Roboto',
                      fontSize: 25,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        color: AppColor().primer,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => allTask()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                    ),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFF2196F3).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _Click = !_Click;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    width: 25,
                                    height: 25,
                                    duration: Duration(milliseconds: 0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor().primer,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.circle,
                                      color: _Click
                                          ? AppColor().primer
                                          : AppColor().putih,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Finish Report',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.withOpacity(0.6)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home),
                        color: AppColor().primer,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.home),
                        color: AppColor().primer,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
