import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_svg/svg.dart';

import 'appMainPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var size;
  bool dropDown2_visibility = false;
  bool dropDown1_visibility = false;
  bool enabled = true;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String selectedItem = "";
  String selectedItem2 = "";
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "", child: Text("")),
    DropdownMenuItem(
      value: "1",
      child: Text(
        "what is the name of your high school?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text(
        "what is the name of your best friend?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "3",
      child: Text(
        "what is your favorite movie?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "4",
      child: Text(
        "what is your favorite color?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "5",
      child: Text(
        "what is your favorite sport?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
  ];

  List<DropdownMenuItem<String>> menuItems2 = const [
    DropdownMenuItem(value: "", child: Text("")),
    DropdownMenuItem(
      value: "1",
      child: Text(
        "what is the name of your high school?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text(
        "what is the name of your best friend?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "3",
      child: Text(
        "what is your favorite movie?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "4",
      child: Text(
        "what is your favorite color?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
    DropdownMenuItem(
      value: "5",
      child: Text(
        "what is your favorite sport?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "QuicksandBold",
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Opacity(
                  opacity: 1,
                  child: SvgPicture.asset(
                    "assets/register2.svg",
                    width: size.width,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Opacity(
                  opacity: 0.7,
                  child: SvgPicture.asset(
                    "assets/register2.svg",
                    width: size.width,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Opacity(
                  opacity: 0.36,
                  child: SvgPicture.asset(
                    "assets/register2.svg",
                    width: size.width,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 32, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 75, 0, 0),
              child: Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "QuicksandBold",
                  fontSize: 32,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 110, 0, 0),
              child: Text(
                "Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: "QuicksandBold",
                ),
              ),
            ),
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 215,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        label: Text(
                          "First Name",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        label: Text(
                          "Last Name",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: Colors.blue, width: 2.0),
                        // ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: Colors.black38, width: 2.0),
                        // ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else if (!value.contains("@gmail.com")) {
                          return "please enter valid email address!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: Colors.blue, width: 2.0),
                        // ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: Colors.black38, width: 2.0),
                        // ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else if (value.length < 8) {
                          return "Password must be atleast 8 characters";
                        } else if (!value.contains(RegExp(r'[A-Z]'))) {
                          return "Password must contain atleast one English Capital letter";
                        } else if (!value.contains(RegExp(r'[0-9]'))) {
                          return "Password must contain atleast one number";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text(
                          "Age",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        label: Text(
                          "Country",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "QuicksandBold",
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        label: Text(
                          "City",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text!";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
                    child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: "QuicksandBold",
                              color: Color(0xFF5C6BC0),
                            ),
                            labelText: 'Select security question 1'),
                        value: selectedItem,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "you must select Something";
                          } else {
                            if (value == selectedItem2) {
                              return "Security questions can't be the same";
                            } else {
                              return null;
                            }
                          }
                        },
                        items: menuItems,
                        onChanged: (value) {
                          setState(() {
                            if (value == null || value.isEmpty) {
                              selectedItem = "";
                              dropDown1_visibility = false;
                            } else {
                              selectedItem = value;
                              setState(() {
                                enabled = false;
                                dropDown1_visibility = true;
                              });
                            }
                          });
                        }),
                  ),
                  Visibility(
                    visible: dropDown1_visibility,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "QuicksandBold",
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                        ],
                        decoration: const InputDecoration(
                          label: Text(
                            "Answer question 1",
                            style: TextStyle(
                              fontFamily: "QuicksandBold",
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text!";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                    child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: "QuicksandBold",
                              color: Color(0xFF5C6BC0),
                            ),
                            labelText: 'Select security question 2'),
                        value: selectedItem2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "you must select Something";
                          } else {
                            if (value == selectedItem) {
                              return "Security questions can't be the same";
                            } else {
                              return null;
                            }
                          }
                        },
                        items: menuItems2,
                        onChanged: (value) {
                          setState(() {
                            if (value == null || value.isEmpty) {
                              selectedItem2 = "";
                              dropDown2_visibility = false;
                            } else {
                              selectedItem2 = value;
                              setState(() {
                                enabled = false;
                                dropDown2_visibility = true;
                              });
                            }
                          });
                        }),
                  ),
                  Visibility(
                    visible: dropDown2_visibility,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "QuicksandBold",
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                        ],
                        decoration: const InputDecoration(
                          label: Text(
                            "Answer question 2",
                            style: TextStyle(
                              fontFamily: "QuicksandBold",
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text!";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: "QuicksandBold",
                            fontSize: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SizedBox(
                            height: 65,
                            width: 65,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF0D47A1),
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {
                                  if (_formKey1.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage()),
                                    );
                                  }
                                },
                                child: const Icon(Icons.arrow_forward)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                  title: '',
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Already have an account? Sign in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontFamily: "QuicksandBold",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
