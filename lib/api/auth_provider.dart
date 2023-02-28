import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _accesToken;
  String? _refreshToken;

  String? get accessToken => _accesToken;
  String? get refreshToken => _refreshToken;

  Future<void> setToken(String accessToken, String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    
    _accesToken = accessToken;
    _refreshToken = _refreshToken;
    notifyListeners();
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access');
    await prefs.remove('refresh');
    _accesToken = null;
    _refreshToken = null;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accesToken = prefs.getString('access');
    notifyListeners();
  }

  bool get isAuthenticated => _accesToken != null;
}
