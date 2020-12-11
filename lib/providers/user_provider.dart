import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {

  UserProvider() {
    loadCurrentUser();
  }

  Future<void> loadCurrentUser() async {
    notifyListeners();
  }

  Future<void> register(UserModel userModel,
      {Function onSuccess, Function onFail}) async {
    try {
      print('success');
      onSuccess();
    } catch (e) {
      print('error' + e);
      onFail(e);
    }
  }
}
