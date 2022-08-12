import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GestureDetectorWidgetScreen extends StatefulWidget {
  const GestureDetectorWidgetScreen({Key? key}) : super(key: key);

  @override
  State<GestureDetectorWidgetScreen> createState() =>
      _GestureDetectorWidgetScreenState();
}

class _GestureDetectorWidgetScreenState
    extends State<GestureDetectorWidgetScreen> {
  var size;
  double _top = 250;
  double _left = 0;
  double _buttonHeight = 75;
  double _buttonWidth = 75;
  List<String> names = ["gg", "ez", "bye", "hi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                child: Material(
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: const Center(
                      child: Text(
                        "gg",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Flexible(
              //   child: ListWheelScrollView(
              //     itemExtent: 4,
              //     physics: const FixedExtentScrollPhysics(),
              //     children: const <Widget>[
              //       Card(
              //         child: ListTile(
              //           title: Text("hi"),
              //         ),
              //       ),
              //       Card(
              //         child: ListTile(
              //           title: Text("hi"),
              //         ),
              //       ),
              //       Card(
              //         child: ListTile(
              //           title: Text("hi"),
              //         ),
              //       ),
              //       Card(
              //         child: ListTile(
              //           title: Text("hi"),
              //         ),
              //       ),
              //       Card(
              //         child: ListTile(
              //           title: Text("hi"),
              //         ),
              //       ),
              //     ],

              //   ),
              // ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text("this is item {$index} --> ${names[index]}"),
                    ));
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    _top = max(0, _top + details.delta.dy);
                    _left = max(0, _left + details.delta.dx);
                    setState(() {});
                  },
                  // onHorizontalDragUpdate: (details) {
                  //   _left = max(0, _left + details.delta.dx);
                  //   setState(() {});
                  // },
                  // onScaleUpdate: (details) {
                  //   _buttonWidth = _buttonWidth * details.horizontalScale.abs();
                  //   details.scale.abs();
                  //   setState(() {});
                  // },
                  child: Container(
                    color: Colors.black,
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
