import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

import 'quiz_brain.dart';


void main() => runApp(Quizzler());

Quiz_brain quiz_brain = Quiz_brain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget> iconList  = [];





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quiz_brain.getQuestion(qNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  // iconList.add(
                  //   Icon(
                  //     Icons.check,
                  //     color: Colors.green,
                  //   ),
                  //
                  // );
                  quiz_brain.nextQuestion();

                  if(quiz_brain.getAnswer( )==true){
                    iconList.add(
                        Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                    );
                  }else{
                    iconList.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quiz_brain.nextQuestion();

                  if(quiz_brain.getAnswer()==false){
                    iconList.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }else{
                    iconList.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: iconList
        )

      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
