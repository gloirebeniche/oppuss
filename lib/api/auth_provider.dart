// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthProvider with ChangeNotifier {
  String? _accessToken;
  String? _refreshToken;
  Employeur? _currentUser;

  AuthProvider() {
    _checkAuth();
  }

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  Employeur? get currentUser => _currentUser;

  Future<void> getCurrentUser(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiGetCurrentUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        _currentUser = Employeur.fromJson(responseData);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<void> _deleteTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    _accessToken = null;
    _refreshToken = null;
    notifyListeners();
  }

  Future<void> _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
    _refreshToken = prefs.getString('refresh_token');
    if (_accessToken != null) {
      await getCurrentUser(_accessToken!);
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _accessToken = responseData['access_token'];
        _refreshToken = responseData['refresh_token'];
        await getCurrentUser(_accessToken!);
        await _saveTokens(_accessToken!, _refreshToken!);
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> register(String email, String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiRegister),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _accessToken = responseData['access_token'];
        _refreshToken = responseData['refresh_token'];
        await getCurrentUser(_accessToken!);
        await _saveTokens(_accessToken!, _refreshToken!);
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final response = await http.get(
        Uri.parse(apiLogout),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $_accessToken',
        },
      );

      if (response.statusCode == 200) {
        await _deleteTokens();
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool get isAuthenticated => _accessToken != null;
}
