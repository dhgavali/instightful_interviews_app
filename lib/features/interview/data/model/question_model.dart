import 'dart:convert';

class Question {
  final String question;
  final String answer;

  Question({required this.question, required this.answer});

  @override
  String toString() => 'Question(question: $question, answer: $answer)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
