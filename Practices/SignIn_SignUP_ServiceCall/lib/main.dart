import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/SignUpPage.dart';
import 'package:flutter_app/ServiceCall.dart';
import 'package:flutter_app/testWidgets/gestureDetectorWidget.dart';
import 'package:flutter_svg/svg.dart';

import 'appMainPage.dart';

// main is the login page
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SignUpPage(),
        '/third': (context) => const MainPage(),
      },
      home: const MyHomePage(
        title: "title",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var size;
  bool enabled = true;
  final _formKey2 = GlobalKey<FormState>();
  String selectedItem = "";
  String selectedItem2 = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: SvgPicture.asset(
                "assets/login1.svg",
                width: size.width,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Opacity(
                  opacity: 0.7,
                  child: SvgPicture.asset(
                    "assets/login1.svg",
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
                    "assets/login1.svg",
                    width: size.width,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 32, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "QuicksandBold",
                  fontSize: 28,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 135, 0, 0),
              child: Text(
                "Back!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "QuicksandBold",
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 320,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                32.0, 0.0, 32.0, 16.0),
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
                            padding: const EdgeInsets.fromLTRB(
                                32.0, 0.0, 32.0, 16.0),
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
                            padding: const EdgeInsets.fromLTRB(8, 25, 4, 4),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "QuicksandBold",
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 4, 16, 4),
                                    child: SizedBox(
                                      height: 65,
                                      width: 65,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFF0D47A1),
                                            shape: const CircleBorder(),
                                          ),
                                          onPressed: () {
                                            if (_formKey2.currentState!
                                                .validate()) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MainPage()),
                                              );
                                            }
                                          },
                                          child:
                                              const Icon(Icons.arrow_forward)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 4, 16, 4),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontFamily: "QuicksandBold",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 16, 4),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontFamily: "QuicksandBold",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
