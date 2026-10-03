import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Image.asset(
              'assets/images/raider-logo.png',
              width: 300,
              //color: const Color.fromARGB(148, 100, 98, 98),
            ),
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   )
          // ),
          const SizedBox(height: 80),
           Text( 
            'Learn Flutter the Fun Way!', 
            style: GoogleFonts.castoroTitling(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 0, 0) 
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.castoroTitling(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  } 
}