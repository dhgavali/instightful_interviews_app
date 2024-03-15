// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InterviewResponse {
  final double content;
  final double language;

  InterviewResponse({
    required this.content,
    required this.language,
  });

  InterviewResponse copyWith({
    double? content,
    double? language,
  }) {
    return InterviewResponse(
      content: content ?? this.content,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'language': language,
    };
  }

  factory InterviewResponse.fromMap(Map<String, dynamic> map) {
    return InterviewResponse(
      content: map['Content'] as double,
      language: map['Language'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory InterviewResponse.fromJson(String source) =>
      InterviewResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InterviewResponse(content: $content, language: $language)';

  @override
  bool operator ==(covariant InterviewResponse other) {
    if (identical(this, other)) return true;

    return other.content == content && other.language == language;
  }

  @override
  int get hashCode => content.hashCode ^ language.hashCode;
}
