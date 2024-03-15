import 'package:instightful_interviews_app/features/interview/data/model/response_model.dart';
class InterviewResult {
  final List<InterviewResponse> resultPerQuestion;
  final double language;
  final double content;
  final double result;

  InterviewResult(
      {required this.resultPerQuestion,
      required this.language,
      required this.content,
      required this.result});
}
