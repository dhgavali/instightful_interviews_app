import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instightful_interviews_app/features/interview/data/model/question_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/response_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/result_model.dart';
import 'package:instightful_interviews_app/features/interview/data/repository/interview_repository_impl.dart';

part 'interview_event.dart';
part 'interview_state.dart';

class InterviewBloc extends Bloc<InterviewEvent, InterviewState> {
  final InterviewRepositoryImpl repository;

  InterviewBloc(this.repository) : super(InterviewInitial()) {
    on<BeginInterviewEvent>((event, emit) async {
      emit(InterviewLoadingState());

      final quesiton = await repository.getQuestions(
          yoe: event.yoe, role: event.role, jd: event.jd);

      quesiton.fold((l) => print("Evaluation failure"),
          (r) => emit(InterviewBeginState(questions: r)));
    });

    on<NextQuestionEvent>((event, emit) async {
      emit(InterviewLoadingState());

      final previousResult = await repository.evaluateQuestion(
          audio: event.audio, question: event.answer, answer: event.answer);

      previousResult.fold(
          (l) => emit(InterviewFailureState(message: l.message)),
          (r) => emit(NextQuestionState(response: r)));
    });

    on<EndInterviewEvent>((event, emit) async {
      emit(InterviewLoadingState());

      final result =
          await repository.generateResult(responses: event.responses);

      result.fold((l) => emit(ResultEvaluationFailureState()), (r) => result);
    });
  }
}
