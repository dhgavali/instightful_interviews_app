import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/auth_backgound.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/buttons.dart';
import 'package:instightful_interviews_app/features/interview/data/repository/interview_repository_impl.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_two.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

import '../../data/model/question_model.dart';
import '../bloc/interview_bloc.dart';

class StartInterview extends StatelessWidget {
  // final String yoe, role, jd;
  const StartInterview({super.key});

  @override
  Widget build(BuildContext context) {
    final InterviewRepositoryImpl repository = InterviewRepositoryImpl();
    return AuthBackgroundScaffold(
      child: SafeArea(
        child: BlocProvider(
          create: (context) => interviewBloc,
          child: BlocConsumer<InterviewBloc, InterviewState>(
            listener: (context, state) {
              // if (state is NextQuestionState) {}    }
              if (state is InterviewResultSuccesfulState) {}
              if (state is InterviewBeginState) {
                if (state.questionNumber == state.questions.length) {
                  context.read<InterviewBloc>().add(EndInterviewEvent());
                  //TODO: go to result screen
                }
              }
            },
            builder: (context, state) {
              if (state is InterviewLoadingState) {
                return Center(child: Loadings.basic());
              }
              if (state is InterviewBeginState) {
                Question questionAndAnswer =
                    state.questions[state.questionNumber];

                if (state.questionNumber == state.questions.length) {
                  return Loadings.basic();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.h),
                      questionNumberContainer(
                          "Question #${state.questionNumber + 1}/${state.questions.length}"),
                      SizedBox(height: 40.h),
                      questionContainer(questionAndAnswer.question),
                      SizedBox(height: 40.h),
                      recordContainer(),
                      SizedBox(height: 40.h),
                      state.questionNumber + 1 != state.questions.length
                          ? LoginButton(
                              "Next Question",
                              onPressed: () {
                                context.read<InterviewBloc>().add(
                                    NextQuestionEvent(
                                        answer: questionAndAnswer.answer,
                                        question: questionAndAnswer.question,
                                        audio: "audio"));
                              },
                              color: Colors.green[400]!,
                            )
                          : Container(),
                      SizedBox(height: 20.h),
                      LoginButton(
                        "End Interview",
                        onPressed: () {
                          context.read<InterviewBloc>().add(NextQuestionEvent(
                              answer: questionAndAnswer.answer,
                              question: questionAndAnswer.question,
                              audio: "audio"));
                        },
                        color: Colors.red[300]!,
                      ),
                    ],
                  );
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Container questionNumberContainer(String text) {
    return Container(
      width: 230.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(0, 4), blurRadius: 2)
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.kgrey,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Container recordContainer() {
    return Container(
      width: 230.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: const Color(0xffE4E5FE),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 1)
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
          child: Row(
            children: [
              const Icon(Icons.radio_button_checked_rounded, color: Colors.red),
              SizedBox(width: 15.w),
              Text(
                "00:00 / 1:00",
                style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.kgrey,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container questionContainer(String question) {
    return Container(
      width: 300.w,
      height: 400.h,
      decoration: BoxDecoration(
        color: const Color(0xffE4E5FE),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 6),
              blurRadius: 5,
              spreadRadius: 4)
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.kgrey,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
