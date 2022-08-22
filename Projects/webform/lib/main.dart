import 'package:flutter/material.dart';
import 'package:webform_flutter/themes.dart';

import 'constants.dart';

bool _value = true;
ThemeMode _themeMode = ThemeMode.light;
bool switchValue = false;
bool isChecked = true;
bool billingAddressVisibility = false;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _themeMode = ThemeMode.light;
    switchValue = true;
    super.initState();
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      // light theme
      theme: lightTheme,
      // dark theme
      darkTheme: darkTheme,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey1 = GlobalKey<FormState>();
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: 0.95 * size.height,
        width: 0.8 * size.width,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black),
        // ),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: _value == true ? Colors.white : Color(0xFF383b40),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  ((size.width - 0.8 * size.width) / 8),
                  16,
                  ((size.width - 0.8 * size.width) / 8),
                  16),
              child: Form(
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Quicksand",
                          color: labelColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    buildCompanyLabel(),
                    const SizedBox(
                      height: 7,
                    ),
                    buildCompanyTextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: size.width > 600
                            ? createRowOfClientAndPhone()
                            : createColumnOfClientAndPhone()),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: size.width > 600
                            ? createRowOfEmailAndPinCode()
                            : createColumnOfEmailAndPincode()),
                    const SizedBox(
                      height: 15,
                    ),
                    createAddressField(),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: size.width > 600
                            ? createRowCityAndStateFields()
                            : createColumnCityandStateFields()),
                    const SizedBox(
                      height: 15,
                    ),
                    createCheckBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    handleBillingAddressFieldVisibility(),
                    const SizedBox(height: 15),
                    handleSwitchAndNextButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (switchValue == true) {
      return primaryBlue;
    } else {
      return primaryYellow;
    }
  }

  Widget buildCompanyTextFormField() {
    return SizedBox(
      width: 0.9 * (0.8 * size.width),
      child: TextFormField(
        cursorWidth: 1,
        cursorColor: Colors.black87,
        style: const TextStyle(
          color: Colors.black54,
          fontFamily: "Quicksand",
          fontSize: 17,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(0.0),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
            child: Icon(
              Icons.abc,
            ),
          ),
          hintText: "Your Company",
          hintStyle: TextStyle(
            fontFamily: "Quicksand",
            color: hintColor,
            fontSize: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: switchValue == true ? primaryBlue : primaryYellow,
                width: 0.8),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightBorderDefaultColor, width: 1),
            borderRadius: BorderRadius.circular(10.0),
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
    );
  }

  Widget buildCompanyLabel() {
    return Text(
      "Company name",
      style: TextStyle(
        fontFamily: "Quicksand",
        color: labelColor,
      ),
    );
  }

  Widget createRowOfClientAndPhone() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right:
                  0.9 * (0.8 * size.width) - 2 * (0.44 * (0.8 * size.width))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Client name",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.44 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.account_circle_rounded,
                      ),
                    ),
                    hintText: "Your Name",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Phone number",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.44 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                    hintText: "(999) 999-9999",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createColumnOfClientAndPhone() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Client name",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  color: labelColor,
                ),
              ),
            ),
            SizedBox(
              width: 0.9 * (0.8 * size.width),
              child: TextFormField(
                cursorWidth: 1,
                cursorColor: Colors.black87,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: "Quicksand",
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0.0),
                  prefixIcon: const Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(
                      Icons.account_circle_rounded,
                    ),
                  ),
                  hintText: "Your Name",
                  hintStyle: TextStyle(
                    fontFamily: "Quicksand",
                    color: hintColor,
                    fontSize: 15,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            switchValue == true ? primaryBlue : primaryYellow,
                        width: 0.8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: lightBorderDefaultColor, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
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
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Phone number",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.9 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                    hintText: "(999) 999-9999",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createRowOfEmailAndPinCode() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right:
                  0.9 * (0.8 * size.width) - 2 * (0.44 * (0.8 * size.width))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.57 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Pincode",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.31 * (0.8 * size.width),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: const Color(0xFF4f46e5)),
                  child: TextFormField(
                    cursorWidth: 1,
                    cursorColor: Colors.black87,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: "Quicksand",
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0.0),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                            top: 0), // add padding to adjust icon
                        child: Icon(
                          Icons.pin_outlined,
                        ),
                      ),
                      hintText: "pincode",
                      hintStyle: TextStyle(
                        fontFamily: "Quicksand",
                        color: hintColor,
                        fontSize: 15,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: switchValue == true
                                ? primaryBlue
                                : primaryYellow,
                            width: 0.8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: lightBorderDefaultColor, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createColumnOfEmailAndPincode() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right:
                  0.9 * (0.8 * size.width) - 2 * (0.44 * (0.8 * size.width))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.9 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Pincode",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.9 * (0.8 * size.width),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: const Color(0xFF4f46e5)),
                  child: TextFormField(
                    cursorWidth: 1,
                    cursorColor: Colors.black87,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: "Quicksand",
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0.0),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                            top: 0), // add padding to adjust icon
                        child: Icon(
                          Icons.pin_outlined,
                        ),
                      ),
                      hintText: "pincode",
                      hintStyle: TextStyle(
                        fontFamily: "Quicksand",
                        color: hintColor,
                        fontSize: 15,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: switchValue == true
                                ? primaryBlue
                                : primaryYellow,
                            width: 0.8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: lightBorderDefaultColor, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Address",
            style: TextStyle(
              fontFamily: "Quicksand",
              color: labelColor,
            ),
          ),
        ),
        SizedBox(
          width: 0.9 * (0.8 * size.width),
          child: Theme(
            data: Theme.of(context)
                .copyWith(primaryColor: const Color(0xFF4f46e5)),
            child: TextFormField(
              minLines: 5,
              maxLines: 5,
              cursorWidth: 1,
              cursorColor: Colors.black87,
              style: const TextStyle(
                color: Colors.black54,
                fontFamily: "Quicksand",
                fontSize: 17,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 5, 10),

                hintText: "Your Address (Area and Street)",
                hintStyle: TextStyle(
                  fontFamily: "Quicksand",
                  color: hintColor,
                  fontSize: 15,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: switchValue == true ? primaryBlue : primaryYellow,
                      width: 0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: lightBorderDefaultColor, width: 1),
                  borderRadius: BorderRadius.circular(10.0),
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
      ],
    );
  }

  Widget createRowCityAndStateFields() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right:
                  0.9 * (0.8 * size.width) - 2 * (0.44 * (0.8 * size.width))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "City",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.44 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.location_city,
                      ),
                    ),
                    hintText: "Your City/Town",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "State",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.44 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.flag_rounded,
                      ),
                    ),
                    hintText: "Your State",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createColumnCityandStateFields() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right:
                  0.9 * (0.8 * size.width) - 2 * (0.44 * (0.8 * size.width))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "City",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.9 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.location_city,
                      ),
                    ),
                    hintText: "Your City/Town",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "State",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: labelColor,
                  ),
                ),
              ),
              SizedBox(
                width: 0.9 * (0.8 * size.width),
                child: TextFormField(
                  cursorWidth: 1,
                  cursorColor: Colors.black87,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Quicksand",
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.flag_rounded,
                      ),
                    ),
                    hintText: "Your State",
                    hintStyle: TextStyle(
                      fontFamily: "Quicksand",
                      color: hintColor,
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              switchValue == true ? primaryBlue : primaryYellow,
                          width: 0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: lightBorderDefaultColor, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget createCheckBox() {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
              billingAddressVisibility = value;
            });
          },
        ),
        Text(
          "Same is Billing Address",
          style: TextStyle(color: labelColor, fontFamily: "Quicksand"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
            onPressed: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Text(
              "Add Billing Address",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
                fontFamily: "QuicksandBold",
                // fontWeight: FontWeight.bold,
                color: switchValue == true ? primaryBlue : primaryYellow,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget handleBillingAddressFieldVisibility() {
    return Visibility(
      visible: !isChecked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Billing Address",
              style: TextStyle(
                fontFamily: "Quicksand",
                color: labelColor,
              ),
            ),
          ),
          SizedBox(
            width: 0.9 * (0.8 * size.width),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(primaryColor: const Color(0xFF4f46e5)),
              child: TextFormField(
                minLines: 5,
                maxLines: 5,
                cursorWidth: 1,
                cursorColor: Colors.black87,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: "Quicksand",
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 5, 10),

                  hintText: "Enter billing address",
                  hintStyle: TextStyle(
                    fontFamily: "Quicksand",
                    color: hintColor,
                    fontSize: 15,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            switchValue == true ? primaryBlue : primaryYellow,
                        width: 0.8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: lightBorderDefaultColor, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
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
        ],
      ),
    );
  }

  Widget handleSwitchAndNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Switch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              if (_value) {
                labelColor = lightLabelColor;
                hintColor = Colors.black26;
                switchValue = true;
                MyApp.of(context)!.changeTheme(ThemeMode.light);
              } else {
                labelColor = darkLabelColor;
                hintColor = Colors.white24;
                switchValue = false;
                MyApp.of(context)!.changeTheme(ThemeMode.dark);
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey1.currentState!.validate()) {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Next ",
                      style: TextStyle(
                        fontFamily: "QuicksandBold",
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
