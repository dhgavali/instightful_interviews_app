// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupDTO {
  final String username;
  final String password;
  final String email;
  final String name;
  final String role;

  SignupDTO(this.username, this.password, this.email, this.name, this.role);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'name': name,
      'role': role,
    };
  }

  factory SignupDTO.fromMap(Map<String, dynamic> map) {
    return SignupDTO(
      map['username'] as String,
      map['password'] as String,
      map['email'] as String,
      map['name'] as String,
      map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupDTO.fromJson(String source) =>
      SignupDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
