// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InterviewResponse {
  final String content;
  final String language;

  InterviewResponse({required this.content, required this.language});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'language': language,
    };
  }

  factory InterviewResponse.fromMap(Map<String, dynamic> map) {
    return InterviewResponse(
      content: map['content'] as String,
      language: map['language'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InterviewResponse.fromJson(String source) =>
      InterviewResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
