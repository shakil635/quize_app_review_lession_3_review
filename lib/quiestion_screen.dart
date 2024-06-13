
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quize_app_lession_3_review/answer_button.dart';
import 'package:quize_app_lession_3_review/data/questions.dart';


class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key,required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

/*
onSelectedAnswer ai function er modde deya value pas er jonno banano hoice.
prottek bar onTab e j answer gula selected hobe oigula pass kora hocce.
AnswerButton er modde ai function define kora hoice
 */

  @override
  State<QuestionScreen>createState()=>_QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>{

var currentQuestionIndex =0;

//answerQuestion er index baranor jonno age akta variable neya hoy currentQuestionIndex

void answerQuestion(String selectedAnswer){
  widget.onSelectedAnswer(selectedAnswer);
  // onSelectedAnswer widget. deya acces neya hoice ai widget er modde
 setState(() {
    currentQuestionIndex++;

    // currentQuestionIndex ak ak kore barano hocce

 });
}

  @override
  Widget build(context){
    
 final currentQuestion = questions[currentQuestionIndex];
 //questions index jano ontab e incres hoy tai currentQuestionInde deya hoice index baranor jonno
  // final currentQuestion = questions[0];

    return SizedBox(
       width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,style: GoogleFonts.aBeeZee( 
                      color:Colors.white,
                      fontSize:20,
                      fontWeight:FontWeight.bold
                      
                    )),
           const SizedBox(height: 30,),
          ...currentQuestion.getShuffledAnswer().map((ans){
            return AnswerButton(
              answerText:ans ,
               onTab: (){
              
                answerQuestion(ans);
               });
           }),
           /*
           akta list er modde r akta list k call kora jay ...(sperade operator deya),
           map er madhome daynamicly button gula r answer gula generate kora hocce.
           getShuffledAnswer ai method er madhome randomly list er modde thaka
            answer gula generate kora hocce
           mul list er akta copy kora hoice List.of deya copy list er record gula 
           randomly generate kora hocce getShuffledAnswer er madhome.
           *answerQuestion button er press er madhome generate kora sob value pass kora hocce onSelectedAnswer er madhome.

            */
        
            //  AnswerButton(answerText: currentQuestion.answer[0], onTab: (){}),
            //  AnswerButton(answerText: currentQuestion.answer[1], onTab: (){}),
            //  AnswerButton(answerText: currentQuestion.answer[2], onTab: (){}),
            //  AnswerButton(answerText: currentQuestion.answer[3], onTab: (){}),
            //manualy generate button and anse in list
      
             
          ],
        ),
      ),
    );
  }
}