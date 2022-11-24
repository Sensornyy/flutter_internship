import 'dart:io';
import 'dart:convert';

import './guests_list_generator.dart';
import 'model/guests_list.dart';

Future<void> main() async {
  GuestsListGenerator generator = GuestsListGenerator(amountOfGuests: 7);
  var listOfGuests = generator.generateRandomList();

  final guestsJSON = {"guests": []};

  for (var g in listOfGuests) {
    guestsJSON["guests"]?.add({"name": g.name, "plusOne": g.plusOne});
  }

  final fileRef = File('source/guests.json');
  fileRef.createSync(recursive: true);
  final guestsStringToJson = jsonEncode(guestsJSON);
  fileRef.writeAsStringSync(guestsStringToJson);

  final guestsStringFromJson = await fileRef.readAsString();
  final guests = jsonDecode(guestsStringFromJson);

  var bill = 200;
  final list = GuestsList.fromJson(guests);

  list.guests.map((g) => g.plusOne ? bill += 200 : bill += 100).toList();
  bill == 1300 ? bill += 100 : bill;

  for (var g in list.guests) {
    print('${g.name} ${g.plusOne ? '+One' : 'Solo'}');
  }
  print(bill);
}
