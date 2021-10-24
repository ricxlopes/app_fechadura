import 'dart:convert';
import 'package:app_autenticador_fechadura/constants/routes.dart';
import 'package:http/http.dart' as http;


class LoginService {
  login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    return response.body;
  }
}