import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/presentation/bloc/interview_bloc.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_two.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.klightBg,
      appBar: AppBar(
          title: const Text(
        "Result",
        style: TextStyle(color: AppColors.kPrimary),
      )),
      body: BlocProvider(
        create: (context) => interviewBloc,
        child: BlocBuilder<InterviewBloc, InterviewState>(
          builder: (context, state) {
            if (state is InterviewLoadingState) {
              return Loadings.basic();
            }
            if (state is InterviewResultSuccesfulState) {
              final result = state.result;
              return SizedBox(
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),

                      MyTexts.h4("Front End Review", color: AppColors.kdark),

                      SizedBox(
                        height: 15.h,
                      ),
                      MyTexts.h3("Overall Result", color: AppColors.kdark),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleCircularProgressBar(
                        valueNotifier: ValueNotifier(result.result),
                        mergeMode: true, // Combine front and back strokes
                        backColor: AppColors.KlightGray,
                        onGetText: (double value) {
                          TextStyle centerTextStyle = TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.withOpacity(value * 0.01),
                          );
                          return Text(
                            '${value.toInt()}%', // Display percentage
                            style: centerTextStyle,
                          );
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              MyTexts.h4("Grammer Score",
                                  color: AppColors.kdark),
                              SizedBox(
                                height: 20.h,
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(result.language),
                                mergeMode:
                                    true, // Combine front and back strokes
                                backColor: AppColors.KlightGray,
                                animationDuration: 2,
                                size: 70,
                                onGetText: (double value) {
                                  TextStyle centerTextStyle = TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                        .withOpacity(value * 0.01),
                                  );
                                  return Text(
                                    '${value.toInt()}%', // Display percentage
                                    style: centerTextStyle,
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MyTexts.h4("Technical Score",
                                  color: AppColors.kdark),
                              SizedBox(
                                height: 20.h,
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(result.content),
                                mergeMode:
                                    true, // Combine front and back strokes
                                backColor: AppColors.KlightGray,
                                animationDuration: 2,
                                size: 70,
                                onGetText: (double value) {
                                  TextStyle centerTextStyle = TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent
                                        .withOpacity(value * 0.01),
                                  );
                                  return Text(
                                    '${value.toInt()}%', // Display percentage
                                    style: centerTextStyle,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),

                      ExpansionPanelList(
                        elevation: 3,
                        animationDuration: const Duration(milliseconds: 500),
                        children: result.resultPerQuestion.map((item) {
                          bool isExpanded = false;
                          return ExpansionPanel(
                            isExpanded: isExpanded,
                            // body: Text("hello"),

                            headerBuilder: (
                              _,
                              isExpanded,
                            ) =>
                                Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 24,
                              ),
                              child: ListTile(
                                title: Text("Question ${item}"),
                                subtitle: Text(item.language.toString()),
                              ),
                            ),
                            body: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () {
                                        // String header = MsgService(context)
                                        //     .getHeader(firm_bean);
                                        // String msg =
                                        //     getmsg(item['bal_amt'].toString());
                                        // MsgService(context).sendMsg(
                                        //     item['mob_no'], header + msg);
                                        // MsgService(context)
                                        //     .sendMsg("918975571378", msg);
                                      },
                                      icon: const Icon(Icons.sms),
                                      label: const Text("sms"),
                                    ),
                                    ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () async {},
                                      icon: const Icon(Icons.book),
                                      label: const Text("ledger"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                      // Expanded(child: ExpandableFAQList())
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ExpandableFAQ extends StatefulWidget {
  final String questionNumber;
  final String question;
  final String summary;

  const ExpandableFAQ({
    Key? key,
    required this.questionNumber,
    required this.question,
    required this.summary,
  }) : super(key: key);

  @override
  _ExpandableFAQState createState() => _ExpandableFAQState();
}

class _ExpandableFAQState extends State<ExpandableFAQ> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ExpansionPanelList(children: [
      ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return ListTile(
            title: Text(
              '${widget.questionNumber} - ${widget.question}',
              style: const TextStyle(fontSize: 16),
            ),
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.grey,
            ),
          );
        },
        isExpanded: _isExpanded,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.summary),
        ),
        canTapOnHeader: true,
      ),
    ]));
  }
}

class ExpandableFAQList extends StatefulWidget {
  @override
  State<ExpandableFAQList> createState() => _ExpandableFAQListState();
}

class _ExpandableFAQListState extends State<ExpandableFAQList> {
  final List<ExpandableFAQData> _questions = [
    // ... same dummy questions as before
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (i, isExpanded) =>
          setState(() => _questions[i].isExpanded = !isExpanded),
      children:
          _questions.map((question) => buildExpansionPanel(question)).toList(),
    );
  }

  ExpansionPanel buildExpansionPanel(ExpandableFAQData question) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(
            '${question.questionNumber} - ${question.question}',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
      isExpanded: question.isExpanded,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(question.summary),
      ),
    );
  }
}

class ExpandableFAQData {
  final String questionNumber;
  final String question;
  final String summary;
  bool isExpanded = false;

  ExpandableFAQData({
    required this.questionNumber,
    required this.question,
    required this.summary,
  });
}
