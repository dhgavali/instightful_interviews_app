import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:instightful_interviews_app/features/interview/data/model/question_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/response_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/result_model.dart';

import '../../../../core/error/failure.dart';

abstract class InterviewRepository {
  Future<Either<Failure, List<Question>>> getQuestions(
      {required String yoe, required String role, required String jd});

  Future<Either<Failure, InterviewResponse>> evaluateQuestion(
      {required String audio,
      required String question,
      required String answer});
  Future<Either<Failure, InterviewResult>> generateResult(
      {required List<InterviewResponse> responses});
}
