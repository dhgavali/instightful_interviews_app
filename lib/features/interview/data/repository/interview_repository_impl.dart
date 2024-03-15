import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:instightful_interviews_app/core/error/exception.dart';
import 'package:instightful_interviews_app/features/auth/data/datasource/authDatasource.dart';

import 'package:instightful_interviews_app/features/interview/data/datasource/interview_datasource.dart';
import 'package:instightful_interviews_app/features/interview/data/model/question_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/response_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/result_model.dart';
import 'package:instightful_interviews_app/features/interview/domain/repository/interview_repository.dart';

import '../../../../core/error/failure.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  final InterviewDatasourceImpl datasource = InterviewDatasourceImpl();

  @override
  Future<Either<Failure, List<Question>>> getQuestions(
      {required String yoe, required String role, required String jd}) async {
    try {
      final List<Question> questions =
          await datasource.getQuestions(yoe: yoe, role: role, jd: jd);

      return Right(questions);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, InterviewResponse>> evaluateQuestion(
      {required String audio,
      required String question,
      required String answer}) async {
    try {
      final response = await datasource.evaluateQuestion(
          audio: audio, question: question, answer: answer);

      return Right(response);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, InterviewResult>> generateResult(
      {required List<InterviewResponse> responses}) async {
    try {
      final response = await datasource.generateResult(responses: responses);

      return Right(response);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }
}
