import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:http/http.dart';

import '../model/user_model.dart';

class UserRepository {

  Dio _dio = Dio();



  Future<User> getUsers() async {
    try {
      var response = await _dio.get('https://reqres.in/api/users?page=2');


      if (response.statusCode == 200) {

        return User.fromJson(response.data);

        // final List result = jsonDecode(response.data)['data'];
        // return result.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw response.statusCode ?? 500;
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data);
    }
  }

  // Future<List<User>> getUsers() async {
  //   Response response = await get(Uri.parse(userUrl));
  //
  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body)['data'];
  //     return result.map((e) => UserModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}
