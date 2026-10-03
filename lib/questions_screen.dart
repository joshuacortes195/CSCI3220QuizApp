import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_progress_bar.dart';

// One question at a time
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  // Sends answers back up to quiz.dart
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// Stateful so it remembers the question
class _QuestionsScreenState extends State<QuestionsScreen> {
  // Current question
  var currentQuestionIndex = 0;

  // Save the answer, go to the next question
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 2;
    // setState rebuilds the screen
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){
    // Use the index so the question changes
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        // outer column keeps the progress bar at the bottom
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // question and answers fill the rest of the screen
            Expanded(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Shuffle answers, one button each
            ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerText: answer,
               onTap: () {
                answerQuestion(answer);
               },
              );
            })
          ],
              ),
            ),
            // shows how far along the quiz we are
            QuizProgressBar(
              currentQuestion: currentQuestionIndex + 1,
              totalQuestions: questions.length,
            ),
          ],
        )
      ),
    );
  }
}