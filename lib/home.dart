import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nola_the_bot/class/answers.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> replies = [
  'It was good.',
  'I have many hopes and dreams for the future. Some I have made open to the public and some are just between me and Jesus Christ, my Lord and Savior. Those I will not be able to tell you but as for the others, I can tell you that they are to grow each day. That is the first step. To learn something new each day that helps me grow into a better man and can be more helpful, productive, and worthwhile to those around me and to those I can touch in social media. The next goal is to stay healthy. I can get better each day by telling myself I am no longer sick. The cells in my body have turned over their illnesses and dis-ease to replace it with love and healing. That is what my goal of the day today is. (It works by the way. Watch scientific experiments on YouTube on rice and water in clear jars when spoken to positive and negatively) Then my next goal is to be in alignment and agreement with my God in all my days tasks which leads me to my hopes and dreams. ',
  'Pretty confident but confused. I have been questioning my capabilities recently.',
  'I am a computer engineer.',
  'The environment is troublesome. Always loud and icky.',
  'god',
  'Somewhat better than the previous month. I had a better days before.',
  'I have bought a new Nintendo Switch. So that\'s something.',
  'Purple.',
  'I have been sleeping a bit less due to work stress actually. Tiresome and irritating.',
  'Phineas and Ferb'
];
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
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _question.text = replies[0];
  // }

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
                      index++;
                      // _question.text = replies[index];
                      _question.text = '';
                    });
                  }
                } else {
                  if (_answerFormKey.currentState.validate()) {
                    setState(() {
                      answers.add(_question.text);
                      index++;
                      // _question.text = replies[index];
                      _question.text = '';
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
                        : Column(
                            children: [
                              Text(
                                'Amazing, you have completed!!',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Text(
                                'Let meet up tomorrow at ${new DateFormat.jm().format(DateTime.now())}',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ],
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
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 15)),
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
