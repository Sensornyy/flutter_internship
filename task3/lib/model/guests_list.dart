import './guest/guest.dart';

class GuestsList {
  final List guests;

  const GuestsList(this.guests);

  factory GuestsList.fromJson(Map<String, dynamic> json) {
    final guestsJson = json['guests'] as List;
    final List<Guest> guestsList = guestsJson.map((g) => Guest.fromJson(g)).toList();

    return GuestsList(guestsList);
  }
}