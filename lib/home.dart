import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nola_the_bot/class/answers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> questions = [
  'Describe your day in one single line.',
  'Can you tell me about your hopes and dreams for the future? What feelings have you had recently about working towards those goals?',
  'Tell me about how confident you have been feeling in your capabilities recently?',
  'What do you do for a living?',
  'Do you like your job?',
  'Whom do you trust the most?',
  'Describe how this month was for you.',
  'What’s your favorite moment this month?',
  'What is your favourite colour?',
  'Tell me about your sleeping habits over the past 1 month. Have you noticed any changes? Difficulty sleeping? Restlessness? How about the quality of your sleep?',
  'What’s your favourite TV show?',
];

class _HomePageState extends State<HomePage> {
  final _answerFormKey = GlobalKey<FormState>();
  int index = 0;
  List<String> answers = [];
  TextEditingController _question = TextEditingController();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: index != 11
          ? FloatingActionButton(
              onPressed: () {
                if (index < 10) {
                  if (_answerFormKey.currentState.validate()) {
                    setState(() {
                      answers.add(_question.text);
                      _question.text = '';
                      index++;
                    });
                  }
                } else {
                  if (_answerFormKey.currentState.validate()) {
                    setState(() {
                      answers.add(_question.text);
                      _question.text = '';
                      index++;
                    });
                    var toServer = GettingStarted(answers);
                    Map a = toServer.convertToJson();
                    print(a);
                  }
                }
              },
              child: Icon(Icons.navigate_next_rounded),
            )
          : Container(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: Lottie.asset('backanima.json'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
          ),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.2),
              color: Colors.transparent,
              child: Center(
                child: Column(
                  children: [
                    index != 11
                        ? Text(
                            '${questions[index]}',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        : Text(
                            'Amazing, you have completed!!',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    index != 11
                        ? Form(
                            key: _answerFormKey,
                            child: TextFormField(
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter value';
                                }
                                return null;
                              },
                              controller: _question,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                                hintText: 'Enter input',
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // Widget slideIt(BuildContext context, int index, animation, int count) {
  //   return SlideTransition(
  //     position: Tween<Offset>(
  //       begin: const Offset(-1, 0),
  //       end: Offset(0, 0),
  //     ).animate(animation),
  //     child: Container(
  //       // height: MediaQuery.of(context).size.height * 0.3,
  //       // width: MediaQuery.of(context).size.width * 0.5,
  //       color: Colors.red,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             '${questions[count]}',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           SizedBox(
  //             height: MediaQuery.of(context).size.height * 0.035,
  //           ),
  //           inputField('enter your answer', _question, 'enter something'),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Container inputField(
      String hint, TextEditingController controller, String validateFailTxt) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.2),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validateFailTxt;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          hintText: hint,
        ),
      ),
    );
  }
}
