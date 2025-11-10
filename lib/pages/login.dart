import 'package:flutter/material.dart';
import 'package:todolist/pages/categories.dart';
import 'package:todolist/pages/signUp.dart';
import 'package:todolist/theme/helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool view = false;
  bool cekText = false;
  final GlobalKey<FormState> globalKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();

  final TextEditingController _simpennEmail = TextEditingController();
  final TextEditingController _simpennPassword = TextEditingController();

  final aturanemail = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

  final aturanPassword = RegExp(r'^[a-zA-Z][A-Za-z0-9]{8,12}$');

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    _simpennEmail.dispose();
    _simpennPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor().putih,

      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeigth * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: AppColor().hitam,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeigth * 0.05,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 30,
                                  color: AppColor().primer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(Icons.email_outlined),
                                Text(
                                  'Your Email',
                                  style: TextStyle(fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Form(
                              key: globalKey1,
                              child: TextFormField(
                                controller: _simpennEmail,
                                focusNode: _focusEmail,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  } else if (!aturanemail.hasMatch(value)) {
                                    return 'Email tidak valid';
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  if (globalKey1.currentState!.validate()) {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(_focusPassword);
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 35),
                            Row(
                              children: [
                                Icon(Icons.lock_outlined),
                                Text(
                                  'Password',
                                  style: TextStyle(fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Form(
                              key: globalKey2,
                              child: TextFormField(
                                controller: _simpennPassword,
                                focusNode: _focusPassword,
                                obscureText: cekText ? view : !view,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      view
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        view = !view;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  } else if (!aturanPassword.hasMatch(value)) {
                                    return 'Password tidak valid';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  if (globalKey2.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 40),
                            TextButton(
                              child: Text(
                                'Forgot ur password',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColor().primer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            SizedBox(height: 60),
                            ElevatedButton(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColor().putih,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 160,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: AppColor().primer,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => categories(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have Account?",
                                  style: TextStyle(fontFamily: 'Roboto'),
                                ),
                                SizedBox(width: 5),
                                TextButton(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: AppColor().primer,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Text(
                              'OR',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 1, color: Colors.grey.withOpacity(0.5)),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image(gambar: 'image/facebook.png'),
                      SizedBox(width: 35),
                      image(gambar: 'image/instagram.png'),
                      SizedBox(width: 35),
                      image(gambar: 'image/twitter.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class image extends StatelessWidget {
  final String gambar;

  const image({required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Image.asset(gambar, width: 45, height: 45);
  }
}
