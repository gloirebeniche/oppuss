import 'dart:convert';

class User {
  final int id;
  final String email;
  final String username;
  final bool worker;
  final bool client;

  User({required this.id, required this.worker, required this.email, required this.username, required this.client});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      worker: json['worker'],
      client: json['client'],
    );
  }
}
