import 'package:flutter/material.dart';
import 'package:todolist/theme/helper.dart';
import 'package:todolist/pages/categories.dart';
import 'package:todolist/pages/login.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> _globalKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _globalKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _globalKey3 = GlobalKey<FormState>();

  final TextEditingController _simpenUsenName = TextEditingController();
  final TextEditingController _simpenEmail = TextEditingController();
  final TextEditingController _simpenPassword = TextEditingController();

  final emailRules = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

  final passwordRules = RegExp(r'^[a-zA-Z][A-Za-z0-9]{8,12}$');

  final FocusNode _userNameNode = FocusNode();
  final FocusNode _userEmailNode = FocusNode();
  final FocusNode _userPasswordNode = FocusNode();

  void dispose() {
    _userNameNode.dispose();
    _userEmailNode.dispose();
    _userPasswordNode.dispose();
    _simpenUsenName.dispose();
    _simpenEmail.dispose();
    _simpenPassword.dispose();
    super.dispose();
  }

  bool _password = false;
  bool _cekIcon = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor().putih,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: AppColor().hitam,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColor().primer,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.person_outline),
                      Text(
                        'Your Username',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _globalKey1,
                  child: TextFormField(
                    controller: _simpenUsenName,
                    focusNode: _userNameNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (_globalKey1.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(_userEmailNode);
                      } else {
                        FocusScope.of(context).requestFocus(_userNameNode);
                      }
                    },
                  ),
                ),
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined),
                      Text(
                        'Your Email',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _globalKey2,
                  child: TextFormField(
                    controller: _simpenEmail,
                    focusNode: _userEmailNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!emailRules.hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (_globalKey2.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(_userPasswordNode);
                      } else {
                        FocusScope.of(context).requestFocus(_userEmailNode);
                      }
                    },
                  ),
                ),
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.lock_outlined),
                      Text('Password', style: TextStyle(fontFamily: 'Roboto')),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _globalKey3,
                  child: TextFormField(
                    controller: _simpenPassword,
                    focusNode: _userPasswordNode,
                    obscureText: _password ? _cekIcon : !_cekIcon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _cekIcon ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _cekIcon = !_cekIcon;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (!passwordRules.hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (_globalKey3.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                      } else {
                        FocusScope.of(context).requestFocus(_userPasswordNode);
                      }
                    },
                  ),
                ),
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.center,
                  child: Form(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: AppColor().primer,
                        padding: EdgeInsets.symmetric(
                          horizontal: 145,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        bool validUserName = _globalKey1.currentState!
                            .validate();
                        bool validEmail = _globalKey2.currentState!.validate();
                        bool validPassword = _globalKey3.currentState!
                            .validate();

                        if (validUserName && validEmail && validPassword) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => categories(),
                            ),
                          );
                        } else {
                          if (!validUserName) {
                            FocusScope.of(context).requestFocus(_userNameNode);
                          } else if (!validEmail) {
                            FocusScope.of(context).requestFocus(_userEmailNode);
                          } else if (!validPassword) {
                            FocusScope.of(
                              context,
                            ).requestFocus(_userPasswordNode);
                          }
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: AppColor().putih,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                      TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColor().primer,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    SizedBox(height: 35),
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
