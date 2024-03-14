import 'dart:convert';
import 'dart:io';

import 'package:instightful_interviews_app/core/api.dart';
import 'package:instightful_interviews_app/core/error/exception.dart';
import 'package:instightful_interviews_app/features/interview/DTO/questionDTO.dart';
import 'package:instightful_interviews_app/features/interview/data/model/question_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/result_model.dart';

import '../model/response_model.dart';

abstract class InterviewDatasource {
  Future<List<Question>> getQuestions(
      {required String yoe, required String role, required String jd});

  Future<InterviewResponse> evaluateQuestion(
      {required File audio, required String question, required String answer});

  Future<InterviewResult> generateResult(
      {required List<InterviewResponse> responses});
}

class InterviewDatasourceImpl implements InterviewDatasource {
  final API api = API();

  @override
  Future<List<Question>> getQuestions(
      {required yoe, required String role, required String jd}) async {
    try {
      final QuestionDTO param = QuestionDTO(yoe: yoe, role: role, jd: jd);
      final response = await api.post(path: "question", params: param.toMap());

      final List<Question> questions = List<Question>.from(
          json.decode(response).map((x) => Question.fromJson(x)));

      return questions;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<InterviewResponse> evaluateQuestion(
      {required File audio,
      required String question,
      required String answer}) async {
    try {
      final response = await api.sendAudioFile("assets/audio/videoplayback.wav",
          "http://127.0.0.1:5000/evaluate", question, answer);

      final InterviewResponse res =
          InterviewResponse.fromJson(json.decode(response));

      return res;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<InterviewResult> generateResult(
      {required List<InterviewResponse> responses}) async {
    double language = 0, content = 0;
    responses.map((e) {
      language += double.parse(e.language);
      content += double.parse(e.content);
    });
    language = language / responses.length;
    content = content / responses.length;
    final result = 0.7 * content + 0.3 * language;
    final InterviewResult interviewResult = InterviewResult(
      resultPerQuestion: responses,
      language: language,
      content: content,
      result: result,
    );
    //TODO: save the result to database
    return interviewResult;
  }
}
