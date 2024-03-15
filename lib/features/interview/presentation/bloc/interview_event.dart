part of 'interview_bloc.dart';

sealed class InterviewEvent extends Equatable {
  const InterviewEvent();

  @override
  List<Object> get props => [];
}

class BeginInterviewEvent extends InterviewEvent {
  final String yoe, role, jd;

  const BeginInterviewEvent(
      {required this.yoe, required this.role, required this.jd});

  @override
  List<Object> get props => [yoe, role, jd];
}

class EndInterviewEvent extends InterviewEvent {}

class NextQuestionEvent extends InterviewEvent {
  final String answer, question;
  final String audio;

  const NextQuestionEvent(
      {required this.answer, required this.question, required this.audio});

  @override
  List<Object> get props => [answer, question, audio];
}
