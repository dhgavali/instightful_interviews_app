// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//TODO: add validation
class LoginDTO {
  ///[Username] can also be used to send password
  final String username;
  final String password;

  LoginDTO({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginDTO.fromMap(Map<String, dynamic> map) {
    return LoginDTO(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDTO.fromJson(String source) =>
      LoginDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
