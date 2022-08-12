void main(List<String> arguments) {
  // define list a
  List a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  // define list b
  List b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  // get the coomon list and print it
  List commonList = getCommonList(a, b);
  print(commonList);
}

// return the numbers that are common in the list a and list b
List getCommonList(List a, List b) {
  // set will ignore duplicates
  Set list = {};
  // find common elements
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        list.add(a[i]);
        break;
      }
    }
  }
  //  convert set to list
  return list.toList();
}
