import 'package:flutter/material.dart';
import 'package:trail_b/Models/Randomusermodel.dart';
import 'package:trail_b/Services/UserServices.dart';

class Userprovider extends ChangeNotifier {
  UserModel? userModel;
  Future<void> getAllUsrData() async {
    userModel = await Userservices.GetAllUsers();
    notifyListeners();
  }
}
