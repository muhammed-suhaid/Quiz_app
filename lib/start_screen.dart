import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 200),
        const Text(
          "Learn Flutter the fun way",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt_sharp),
          label: const Text(
            "Start Quiz",
          ),
        ),
        const SizedBox(height: 25),
        Image.asset('images/start_screen.png'),
        const SizedBox(height: 10),
      ],
    );
  }
}
