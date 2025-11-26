import 'package:dio/dio.dart';
import 'package:trail_b/Models/AuthModel.dart';

class Authservices {
  static Dio dio = Dio();
  static Future<Authmodel> Login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return Authmodel.fromjson(response.data);
    } on DioException catch (ero) {
      throw Exception("Server Error");
    }
  }

  static Future<Authmodel> SignUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": name,
          "Phone": phone,
          "Email": email,
          "Password": password,
        },
      );
      return Authmodel.fromjson(response.data);
    } on DioException catch (ero) {
      throw Exception("Server Error");
    }
  }
}
