import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int question = 0;
  int _score = 0;
  bool? answers;
  final List<Question> questions = [
    Question('The sky is blue. ', true),
    Question(' Cats can fly. ', false),
    Question('Flutter is a framework for building mobile apps. ', true),
    Question('Bishkek is the capital city of Kyrgyzstan', true),
    Question('My dog can read', false),
  ];

  void checkAnswer(bool userAnswer) {
    final correctAnswer = questions[question].answer;
    setState(() {
      if (userAnswer == correctAnswer) {
        _score++;
        answers = true;
      } else {
        answers = false;
      }
      if (question < questions.length - 1) {
        question++;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[question];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Quiz True or False',
          style: TextStyle(color: Colors.black, height: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.questionText,
              style: TextStyle(fontSize: 44.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => checkAnswer(true),
                    child: Text(
                      'True',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 150.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    child: Text(
                      'False',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 150.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  if (answers != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          answers! ? Icons.check : Icons.cancel,
                          color: answers! ? Colors.green : Colors.red,
                          size: 50.0,
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final bool answer;
  Question(this.questionText, this.answer);
}
