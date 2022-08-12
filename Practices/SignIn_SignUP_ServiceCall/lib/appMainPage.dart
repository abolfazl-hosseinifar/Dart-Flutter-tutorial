import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/ServiceCall.dart';
import 'package:flutter_app/testWidgets/gestureDetectorWidget.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var size;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String selectedItem = "";
  String selectedItem2 = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
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
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(50, 125, 0, 0),
          child: Text(
            "Welcome!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "QuicksandBold",
              fontSize: 28,
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 450,
              ),
              const Text(
                "You can use the \n     APP Now!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "QuicksandBold",
                  fontSize: 28,
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SerViceCall()),
                    );
                  },
                  child: Text("go to the test page!"))
            ],
          ),
        )
      ],
    ));
  }
}
