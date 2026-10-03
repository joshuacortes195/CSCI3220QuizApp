import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Josh 
// progress bar that sits at the bottom of the quiz
class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  final int currentQuestion;

  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // tells the user which question they are on
        Text(
          'Question $currentQuestion of $totalQuestions',
          // styling for the progress text
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // rounds the ends of the bar like our buttons
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          // slides the bar forward instead of jumping
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: currentQuestion / totalQuestions),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              // the bar itself, black fill on a light track
              return LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: const Color.fromARGB(120, 255, 255, 255),
                valueColor: const AlwaysStoppedAnimation(
                  Color.fromARGB(255, 0, 0, 0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
