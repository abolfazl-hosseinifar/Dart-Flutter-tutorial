import "dart:io";

void main() {
  // our data in our dictionary
  var dictionary = {
    'Albert Einstein': '03/14/1879',
    'Benjamin Franklin': '01/17/1706',
    'Ada Lovelace': '12/10/1815',
    'Isaac Newton': '04/01/1643',
    'Nikola Tesla': '10/07/1856',
  };
  print('Welcome to the birthday dictionary. We know the birthdays of:');
  // print the names of people in our dictionary
  for (final i in dictionary.entries) {
    print(i.key);
  }
  while (true) {
    print("Who's birthday do you want to look up? enter 0 to exit");
    // read user input
    String? name = stdin.readLineSync();
    // exit application
    if (name == "0") {
      break;
    }
    // find the birthday of the given name
    else {
      if (dictionary.containsKey(name)) {
        print(dictionary[name]);
      } else {
        print("sry we couldn't find that name!");
      }
    }
  }
}
