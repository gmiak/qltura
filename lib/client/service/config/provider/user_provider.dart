import 'package:flutter/foundation.dart';
import 'package:qltura/server/controller/user_controller.dart';
import 'package:qltura/server/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserQ? _user;
  final _userController = UserController();
  UserQ get getUser =>
      _user ?? UserQ(username: "error", email: "error@error.com");

  Future<void> refreshUser() async {
    UserQ userQ = await _userController.getUserdata();
    _user = userQ;
    notifyListeners(); // Listning to the change that occures with our global variable
  }
}
