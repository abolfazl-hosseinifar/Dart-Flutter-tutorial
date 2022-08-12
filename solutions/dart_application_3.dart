import "dart:io";
import 'dart:convert';

void main() async {
  // our json file path
  String filePath = "../assets/a.json";
  // read the json file
  final m = await readFromJsonFile(filePath);
  print("Welcome to the birthday dictionary.");
  // our main menu
  while (true) {
    print('We know the birthdays of:');
    // print all the names of people that we have in our file ( map )
    for (final i in m.entries) {
      print(i.key);
    }
    print(
        "Who's birthday do you want to look up? <enter 1 to add new item to the dictionary>  <enter 0 to exit>");
    // get the user input
    String? name = stdin.readLineSync();
    // exit from the application
    if (name == "0") {
      break;
    }
    // get the information of a person that user wants to add in our dictionary
    else if (name == "1") {
      print("enter the name: ");
      String? itemName = stdin.readLineSync();
      print("enter the date: ");
      String? itemDate = stdin.readLineSync();
      // chech if we already have a person with that name in our dictionary
      if (m.containsKey(itemName)) {
        print(
            "we have that name in our dictionary do you want to update the date? yes/no");
        String? answer = stdin.readLineSync();
        // ask the user if he/she wants to update the data
        if (answer == "yes") {
          m[itemName] = itemDate;
          print("the date value of $itemName has been updated!");
          // update our json file
          writeToJsonFile(jsonEncode(m).toString());
        }
      } else {
        m[itemName] = itemDate;
        print("new item added to the dictionary");
        // update our json file
        writeToJsonFile(jsonEncode(m).toString());
      }
    }
    // if we are here it means that user didn't choose to enter a name or exit the application
    // so he/she wants to know the birthday of a person in our dictionary
    else {
      if (m.containsKey(name)) {
        print(m[name]);
      } else {
        print("sry we couldn't find that name!");
      }
    }
  }
}

// function to read the json file and create a map from it
Future<Map> readFromJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = await jsonDecode(input);
  return map;
}

// function to write data to the json file
Future<File> writeToJsonFile(String data) async {
  var testFile = await File("../assets/a.json").writeAsString(data);
  return testFile;
}
