part of 'interview_bloc.dart';

sealed class InterviewState extends Equatable {
  const InterviewState();

  @override
  List<Object> get props => [];
}

final class InterviewInitial extends InterviewState {}

final class InterviewLoadingState extends InterviewState {}

final class InterviewFailureState extends InterviewState {
  final String message;

  const InterviewFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

final class InterviewBeginState extends InterviewState {
  final List<Question> questions;

  const InterviewBeginState({required this.questions});

  @override
  List<Object> get props => [questions];
}

final class InterviewEndState extends InterviewState {
  final InterviewResult result;

  const InterviewEndState({required this.result});

  @override
  List<Object> get props => [result];
}

final class NextQuestionState extends InterviewState {
  final InterviewResponse response;

  const NextQuestionState({required this.response});

  @override
  List<Object> get props => [response];
}

final class ResultEvaluationFailureState extends InterviewState {}
