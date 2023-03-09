import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AuthProvider with ChangeNotifier {
  String? _accesToken;
  String? _refreshToken;
  User? _currentUser;

  AuthProvider() {
    _getCurrentUser();
  }

  String? get accessToken => _accesToken;
  String? get refreshToken => _refreshToken;
  User? get currentUser => _currentUser;


  Future<void> _getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token') ?? '';

    try {
      final response = await http.get(
        Uri.parse(api_get_current_user),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _currentUser = User.fromJson(responseData);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    _accesToken = null;
    _refreshToken = null;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accesToken = prefs.getString('access_token');
    _refreshToken = prefs.getString('refresh_token');
    _getCurrentUser();
    notifyListeners();
  }


  bool get isAuthenticated => _accesToken != null;
}


