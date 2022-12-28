import 'package:hive/hive.dart';

import '../model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');
  }

  Future<String?> authenticateUser(String username, String password) async {
    final success = _users.values.any((user) => user.username == username && user.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }
}