import 'package:dio/dio.dart';
import 'package:trail_b/Models/Randomusermodel.dart';

class Userservices {
  static Dio dio = Dio();
  static Future<UserModel> GetAllUsers() async {
    try {
      Response response = await dio.get(
        "https://randomuser.me/api/?results=10",
      );
      return UserModel.fromjson(json: response.data);
    } on DioException catch (er) {
      throw Exception("Server Error");
    }
  }
}
