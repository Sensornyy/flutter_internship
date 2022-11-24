import 'dart:math';

import './model/guest/guest.dart';

const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

abstract class Generator {
  final Random random = Random();

  List generateRandomList();

  int generateRandomNumber(int value) {
    return random.nextInt(value);
  }

  bool generateRandomBoolean() {
    return random.nextBool();
  }
}

class GuestsListGenerator extends Generator {
  final int amountOfGuests;

  GuestsListGenerator({required this.amountOfGuests});

  @override
  List<Guest> generateRandomList() {
    final List<Guest> list = [];

    for (var i = 0; i < amountOfGuests; i++) {
      list.add(
          Guest(name: generateRandomName(), plusOne: generateRandomBoolean()));
    }

    return list;
  }

  String generateRandomName() {
    return List.generate(generateRandomNumber(12),
        (index) => chars[generateRandomNumber(chars.length)]).join();
  }
}
