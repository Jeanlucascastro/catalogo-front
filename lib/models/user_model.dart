
import 'package:catalogo_front/services/auth_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {


  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void singUp() async {

  }

  void singIn({
    required String email,
    required String pass,
    required VoidCallback onSuccess,
    required VoidCallback onFail}) async {
    print("object");
    isLoading = true;
    notifyListeners();

    AuthService.login(login: email, password: pass).then((bool value) {
      print("Bool $value");
      isLoading = false;
      notifyListeners();
    });
  }

  void recoverPass() {

  }

  bool isLoggedIn(){
  return false;
  }

}