import 'package:flutter/material.dart';
import 'package:trail_b/Models/AuthModel.dart';
import 'package:trail_b/Services/AuthServices.dart';

class Authprovidder extends ChangeNotifier {
  Authmodel? authmodel;
  Future<void> Logindata({required String Email, required String Pass}) async {
    authmodel = await Authservices.Login(email: Email, password: Pass);
    notifyListeners();
  }

  Future<void> SignUpdata({
    required String name,
    required String phone,
    required String Email,
    required String Pass,
  }) async {
    authmodel = await Authservices.SignUp(
      name: name,
      phone: phone,
      email: Email,
      password: Pass,
    );
    notifyListeners();
  }
}
