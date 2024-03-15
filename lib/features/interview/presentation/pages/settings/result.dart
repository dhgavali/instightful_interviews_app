import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/data/model/response_model.dart';
import 'package:instightful_interviews_app/features/interview/data/model/result_model.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ValueNotifier<double> overallResult = ValueNotifier(0.8);
  final ValueNotifier<double> techResult = ValueNotifier(0.8);
  final ValueNotifier<double> grammerResult = ValueNotifier(0.8);
// final ValueNotifier<double> overallResult = ValueNotifier(0.8);

//  InterviewResult? interviewResult;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    overallResult.value = 80;
    techResult.value = 72;
    grammerResult.value = 88;

  }

  @override
  void dispose() {
    overallResult.dispose();
    techResult.dispose();
    grammerResult.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.klightBg,
      appBar: AppBar(
          title: Text(
        "Result",
        style: TextStyle(color: AppColors.kPrimary),
      )),
      body: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h,),

            MyTexts.h4("Front End Review", color: AppColors.kdark),
            
            SizedBox(height: 15.h,),
            MyTexts.h3("Overall Result", color: AppColors.kdark),
            SizedBox(
              height: 15.h,
            ),
            SimpleCircularProgressBar(
              valueNotifier: overallResult,
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
                    MyTexts.h4("Grammer Score", color: AppColors.kdark),
                    SizedBox(
                      height: 20.h,
                    ),
                    SimpleCircularProgressBar(
                      valueNotifier: overallResult,
                      mergeMode: true, // Combine front and back strokes
                      backColor: AppColors.KlightGray,
                      animationDuration: 2,
                      size: 70,
                      onGetText: (double value) {
                        TextStyle centerTextStyle = TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.withOpacity(value * 0.01),
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
                    MyTexts.h4("Technical Score", color: AppColors.kdark),
                    SizedBox(
                      height: 20.h,
                    ),
                    SimpleCircularProgressBar(
                      valueNotifier: overallResult,
                      mergeMode: true, // Combine front and back strokes
                      backColor: AppColors.KlightGray,
                      animationDuration: 2,
                      size: 70,
                      onGetText: (double value) {
                        TextStyle centerTextStyle = TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.withOpacity(value * 0.01),
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
            SizedBox(height: 20,),
          Divider(),

SingleChildScrollView(
                child: ExpansionPanelList.radio(
                  elevation: 3,
                  animationDuration: Duration(milliseconds: 500),
                  children: _items
                      .map(
                        (item) => ExpansionPanelRadio(
                          value: item,
                          canTapOnHeader: true,
                          headerBuilder: (
                            _,
                            isExpanded,
                          ) =>
                              Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 24,
                            ),
                            child: ListTile(
                              title: Text(
                             item.content.toString()
                              ),
                              subtitle: Text(
                               item.language.toString()
                              ),
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
                                      Colors.red
                                      ),
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
                                    icon: Icon(Icons.sms),
                                    label: Text("sms"),
                                  ),
                                  ElevatedButton.icon(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                     Colors.red
                                      ),
                                    ),
                                    onPressed: () async {
                                     
                                    },
                                    icon: Icon(Icons.book),
                                    label: Text("ledger"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            // Expanded(child: ExpandableFAQList())
          ],
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
    return Container(child: ExpansionPanelList(children: [

      ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(
            '${widget.questionNumber} - ${widget.question}',
            style: TextStyle(fontSize: 16),
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
      expansionCallback: (i, isExpanded) => setState(() => _questions[i].isExpanded = !isExpanded),
      children: _questions.map((question) => buildExpansionPanel(question)).toList(),
    );
  }

  ExpansionPanel buildExpansionPanel(ExpandableFAQData question) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(
            '${question.questionNumber} - ${question.question}',
            style: TextStyle(fontSize: 16),
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