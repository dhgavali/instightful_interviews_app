class QuestionRequest {
  final String jd;
  final String role;
  final String yoe;

  QuestionRequest({
    required this.jd,
    required this.role,
    required this.yoe,
  });

  factory QuestionRequest.fromJson(Map<String, dynamic> json) {
    return QuestionRequest(
      jd: json['jd'] ?? '',
      role: json['role'] ?? '',
      yoe: json['yoe'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jd'] = jd;
    data['role'] = role;
    data['yoe'] = yoe;
    return data;
  }

  factory QuestionRequest.fromMap(Map<String, dynamic> map) {
    return QuestionRequest(
      jd: map['jd'] as String,
      role: map['role'] as String,
      yoe: map['yoe'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jd': jd,
      'role': role,
      'yoe': yoe,
    };
  }
}
