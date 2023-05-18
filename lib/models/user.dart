class Employeur {
  final int id;
  final String password;
  final DateTime? lastLogin;
  final String username;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? gender;
  final String? phoneNumber;
  final String? address;
  final DateTime? dateOfBirth;
  final String? city;
  final bool isActive;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;

  Employeur({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
    this.gender,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.city,
    required this.isActive,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employeur.fromJson(Map<String, dynamic> json) {
    return Employeur(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      username: json['username'],
      firstName: json['prenom'],
      lastName: json['nom'],
      email: json['email'],
      gender: json['civilite'],
      phoneNumber: json['tel'],
      address: json['adress'],
      dateOfBirth: json['date_naiss'] != null ? DateTime.parse(json['date_naiss']) : null,
      city: json['ville'],
      isActive: json['is_active'],
      isAdmin: json['is_admin'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

