import "dart:io";
import 'dart:convert';

void main() async {
  // our json file path
  String filePath = "../assets/a.json";
  // read data from json file
  final m = await readFromJsonFile(filePath);
  // list of months
  List<String> monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  // to store the number of birthdays for each month
  List<int> list = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  for (final i in m.entries) {
    // split each date value by '/' to find the month
    var v = i.value.toString().split("/");
    // store the month value
    String s = v[0];
    // update our list that contains the number of birthdays for each month
    list[int.parse(s) - 1]++;
    // create a map of month and the number of birthdays
    Map<String, int> data = Map();
    // insert the values into the map
    for (int i = 0; i < list.length; i++) {
      // ignore the month that has 0 birthdays
      if (list[i] != 0) {
        data[monthList[i]] = list[i];
      }
    }
    // print the map
    print(data);
  }
}

Future<Map> readFromJsonFile(String filePath) async {
  // read the file as a string
  var input = await File(filePath).readAsString();
  // create a map from it as a json
  var map = await jsonDecode(input);
  return map;
}
