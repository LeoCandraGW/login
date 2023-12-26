// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'dart:convert';
import 'package:login/data/models/login_model.dart';
import '../../common/exception.dart';
import 'package:http/io_client.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> postLogin(username, password);
  Future<void> postLogout();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  static const BASE_URL = 'YOUR API URL';
  final IOClient client;
  LoginRemoteDataSourceImpl({required this.client});
  @override
  Future<LoginModel> postLogin(username, password) async {
    final response = await client.post(Uri.parse('$BASE_URL/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "username": username,
          "password": password,
        }));
    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      return LoginModel.fromJson(json.decode(response.body));
    }
  }

  @override
  Future<void> postLogout() async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/api/logout'),
      );

      if (response.statusCode == 200) {
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
