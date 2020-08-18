import 'dart:convert';

import 'package:arena/model/login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = 'https://reqres.in/api/login';

    final response = await http.post(url, body: loginRequestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
