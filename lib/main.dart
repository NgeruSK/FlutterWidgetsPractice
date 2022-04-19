import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/answers_button.dart';
import 'package:user_app/next_prev.dart';
import './question.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const questions = [
    {
      'question_text':'What\'s your favourite meal?',
      'answers_options':['Meat','Ugali','Chicken','Sukuma']
    },
    {
      'question_text':'What\'s your highest school grad?',
      'answers_options':['Primary School','High School','Certificate Artisan','Diploma']
    },
    {
      'question_text':'Which of the pets would you choose ?',
      'answers_options':['Cow','Mouse','Cat']
    }

  ];
  var questonIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("UsersApp"),systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
          ),
          body: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child:questonIndex<questions.length && questonIndex >= 0 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Question(questions[questonIndex]['question_text'] as String),
                  Column(
                    children: [
                      ...(questions[questonIndex]['answers_options'] as List<String>).map((answer)
                      {
                        return AnswerButton(answer, nextQuestion);
                      }).toList(),

                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment :MainAxisAlignment.center,
                      children: [
                        NextPrevious('Previous Question', prevQuestion),
                        NextPrevious('Skip Question', nextQuestion),
                      ],
                    ),
                  )


                ],

              )
                  :
              Center(child: Column(
                children: <Widget>[
                  Text('You Pushed to the end', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
                  TextButton(onPressed: (){
                    setState(() {
                      questonIndex = 0;
                    });
                  }, child: Text('Restart Quiz', style: TextStyle(fontWeight: FontWeight.bold),),),
                ],
              ))

          ),
        )
    );
  }

  void nextQuestion() {
    if(questonIndex < questions.length) {
      setState(() {
        questonIndex += 1;
      });
    }
    else
      {
        print('the end onwards');
      }
  }

  void prevQuestion() {
    setState(() {
      questonIndex -= 1;
    });
  }
}

