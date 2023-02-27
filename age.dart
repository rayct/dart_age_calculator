// Version: 1.0
// An implementation of the age and birthday program in Dart:
// that prompts the user for their birthdate and then calculates their age and days until their next birthday:
// This implementation uses the intl package to parse the date string and format the output strings.
// It also uses the DateTime class and its methods to calculate the age and days until the next birthday.
// To optimize the code, we could add error checking for invalid date inputs and add more efficient algorithms for calculating the age and days until the next birthday.

import 'dart:io';
import 'package:intl/intl.dart';

void main() {
  stdout.write("Enter your date of birth (format: DD/MM/YYYY): ");
  var inputDate = stdin.readLineSync();

  var birthDate = DateFormat("dd/MM/yyyy").parse(inputDate, true);
  if (birthDate == null) {
    print("Invalid date format. Please enter date in the format DD/MM/YYYY.");
    return;
  }

  var age = DateTime.now().year - birthDate.year;
  print("You are $age years old.");

  var nextBirthday = DateTime(DateTime.now().year, birthDate.month, birthDate.day);
  if (nextBirthday.isBefore(DateTime.now())) {
    nextBirthday = DateTime(DateTime.now().year + 1, birthDate.month, birthDate.day);
  }

  var daysToBirthday = nextBirthday.difference(DateTime.now()).inDays;
  print("There are $daysToBirthday days until your next birthday.");
}


// Version: 1.0.1
// Optimized version of the program:
// This version:
// This version is similar to the previous version, but there are a few optimizations:

// 1. Used DateTime.tryParse instead of DateTime.parse to handle invalid input dates without throwing an exception.
// 2. Used DateTime.now().difference(birthDate).inDays ~/ 365 to calculate the age in years, which avoids using a floating-point division.
// 3. Used DateTime.isBefore instead of comparing dates with < to improve readability.
// 4. Used DateTime.difference to calculate the difference between dates in days.


import 'dart:io';

void main() {
  stdout.write("Enter your date of birth (format: DD/MM/YYYY): ");
  var inputDate = stdin.readLineSync();

  var birthDate = DateTime.tryParse(inputDate);
  if (birthDate == null) {
    print("Invalid date format. Please enter date in the format DD/MM/YYYY.");
    return;
  }

  var age = DateTime.now().difference(birthDate).inDays ~/ 365;
  print("You are $age years old.");

  var nextBirthday = DateTime(DateTime.now().year, birthDate.month, birthDate.day);
  if (nextBirthday.isBefore(DateTime.now())) {
    nextBirthday = DateTime(DateTime.now().year + 1, birthDate.month, birthDate.day);
  }

  var daysToBirthday = nextBirthday.difference(DateTime.now()).inDays;
  print("There are $daysToBirthday days until your next birthday.");
}




