import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  const factory Guest({required String name, required bool plusOne}) = _Guest;

  factory Guest.fromJson(Map<String, Object?> json) => _$GuestFromJson(json);
}