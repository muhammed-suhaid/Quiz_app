import 'package:flutter/material.dart';
import 'package:quiz_app_/questions.dart';
import 'package:quiz_app_/result_screen.dart';
import 'package:quiz_app_/start_screen.dart';
import 'package:quiz_app_/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen= StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen() {
    setState(() {
      activeScreen = QustionsScreen(onSelectAnswer:chooseAnswer);
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {  
        activeScreen=ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);  
      });
    }
  }
  void restartQuiz(){
    setState(() {
      activeScreen=QustionsScreen(onSelectAnswer: chooseAnswer);
      selectedAnswers=[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 85, 208, 255),
              Color.fromARGB(255, 7, 136, 187),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
