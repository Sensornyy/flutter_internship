import 'dart:convert';

import './models/guests_list';

void main() {
  solutionEx2();
}

void solutionEx2() {
  final guestsJSON = {
    "guests": [
      {"name": "Ted", "plusOne": true},
      {"name": "Robin", "plusOne": true},
      {"name": "Carl", "plusOne": null},
      {"name": "Debora", "plusOne": true},
      {"name": "Enrique", "plusOne": true},
      {"name": "Fred", "plusOne": true}
    ]
  };

  var bill = 200;
  final jsonParsed = jsonEncode(guestsJSON);
  final list = GuestsList.fromJson(jsonDecode(jsonParsed));

  list.guests.map((g) => g.plusOne ? bill += 200 : bill += 100).toList();
  bill == 1300 ? bill += 100 : bill;
  print(bill);
}