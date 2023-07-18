import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('QUIZZLER'),
        ),
        backgroundColor: Colors.white,
        body: QuizApp(),
      ),
    );
  }
}

//
//
//
//logic building in stateful widgets
//stateful widget
// comment
//comment
//

class QuizApp extends StatefulWidget {

  @override
  State<QuizApp> createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {
  int Qnumber = 0;

  List<Icon> iconkeeper = [
    Icon(Icons.check,
      color: Colors.green,
    ),
    Icon(Icons.close,
      color: Colors.red,
    ),
  ];

  // List QuestionsBank = [
  //  QuestionsBank('Some cats are actually allergic to humans',true)
  // ];


  // List<bool> Answer = [
  //   true,
  //   false,
  //   true,
  // ];

  void nextques () {


    if (Qnumber < questionlist.length-1){
     Qnumber++;
    }
    else{
      Alert(
          context: context, title: "QUIZ IS OVER", desc: "CLOSE THE APP AND RESTART").show();

    }
  }

  List <QuestionsBank> questionlist =[
    QuestionsBank(q: 'Some cats are actually allergic to humans',a: true),
    QuestionsBank(q: 'You can lead a cow down stairs but not up stairs.',a: false),
    QuestionsBank(q: 'A slug\'s blood is green.' ,a: true),
    QuestionsBank(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',a: true),
    QuestionsBank(q: 'It is illegal to pee in the Ocean in Portugal.',a: true),
    QuestionsBank(q: 'No piece of square dry paper can be folded in half more than 7 times.',a: false),
    QuestionsBank(q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',a: true),
    QuestionsBank(q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',a: false),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 6,
                child: Center(child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text(questionlist[Qnumber].questionText,
                  style:
                  TextStyle(
                    fontSize: 30.0
                  ),
                  ),
                ))),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ElevatedButton(

                  onPressed: () {
                    setState(() {

                      bool correct = questionlist[Qnumber].Answer;
                      if (correct == true){
                        iconkeeper.add(
                          Icon(Icons.check,color: Colors.green));

                      }
                      else {
                        iconkeeper.add(
                          Icon(Icons.close,color: Colors.red));}
                      nextques();
                    });



                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                  ),

                  child: Text('TRUE'),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ElevatedButton(

                  onPressed: () {
                    setState(() {
                      bool correct = questionlist[Qnumber].Answer;
                      if ( correct == false){
                        iconkeeper.add(
                            Icon(Icons.check,color: Colors.green));

                      }
                            else { iconkeeper.add(
                          Icon(Icons.close,color: Colors.red));}



                      nextques();
                    });

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                  ),
                  child: Text('False'),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: iconkeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
