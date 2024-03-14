// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionDTO {
  final String yoe;
  final String role;
  final String jd;

  QuestionDTO({required this.yoe, required this.role, required this.jd});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'yoe': yoe,
      'role': role,
      'jd': jd,
    };
  }

  factory QuestionDTO.fromMap(Map<String, dynamic> map) {
    return QuestionDTO(
      yoe: map['yoe'] as String,
      role: map['role'] as String,
      jd: map['jd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionDTO.fromJson(String source) =>
      QuestionDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
