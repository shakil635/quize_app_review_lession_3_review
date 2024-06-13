
import 'package:flutter/material.dart';
import 'package:quize_app_lession_3_review/data/questions.dart';
import 'package:quize_app_lession_3_review/quiestion_screen.dart';
import 'package:quize_app_lession_3_review/result_screen.dart';
import 'package:quize_app_lession_3_review/start_screen.dart';

class Quize extends StatefulWidget{
  const Quize({super.key});
  @override
  State<Quize> createState()=>_QuizeState();

}

class _QuizeState extends State<Quize>{
 List<String> selectedAnswer = [];
 //akta list banano hoice selectedAnswer.jar modde question screen theke ana data rakha hocce

var activeScreen = "Start-Screen";
//ternary operator babohar kore kora jay 9initState bade

// @override
//   void initState() {
//  activeScreen = "Start-Screen";
//  //startScreen er state k lifting stater er madhome quize screen e niya asa hoice
//     super.initState();
//   }




void switchScreen(){
setState(() {
  activeScreen = "Question-Screen";
});
}

void chooseAnswer(String answer){
  selectedAnswer.add(answer);
  if(selectedAnswer.length==questions.length){
    setState(() {
     // selectedAnswer = [];
      activeScreen="Result-Screen";
    });
  }
}
/*
List index error jano na ase tai 
selectedAnswer.length==questions.length tahole user k abar start-screen e niya jabe.
setState er modde deya dayo hoice karon screen ta poriborton hobe.
selectedAnswer er modde store kore rakha 
value gula abar reset kora hocce setState er madhome.
question screen theke ana data selectedAnswer list er modde rakha hocce add() method deya.
*activeScreen = ResultScreen kora hoice question ses korar por user tar folafol dekta pabe result screen e

 */



void resetQuize(){
  setState(() {
    selectedAnswer=[];
    activeScreen = "Start-Screen";
  });
}
/*
resetQuize button e click dele abar 
 */


  @override
  Widget build(context){
  
  //final screenWidget = activeScreen == "Start-Screen" ? StartScreen(switchScreen): const QuestionScreen();
  // initState bade ternary babohar kore aita kora jay

  Widget screenWidget = StartScreen(switchScreen);


   if(activeScreen == "Question-Screen"){
    screenWidget =  QuestionScreen(onSelectedAnswer: chooseAnswer,);
   }
//ternary bade if statement deya same kaj hoy
//onSelectedAnswer er madhome ana value choose answer er modde add kora hocce.

  if(activeScreen=="Result-Screen"){
    screenWidget = ResltScreen(
      chosenAnswer: selectedAnswer,
      resetQuize: resetQuize,
      );
  }
  /*
  if condition er madhome bole deya hocce activeScreen equle jodi 
  result screen hoy ta hole screenWidget ResultScreen hobe.
  *ResltScreen screen er modde constructor er modde deya akta list pass kora hoice chosenAnswer list.
  * selectedAnswer list er modde j data gula store kora hocce oigula Result scren e transfer kora hocce.
  *user k tar result data dekhanor jonno.
  
   */

  
    return MaterialApp(home:  Scaffold( 
    body:Container(
      decoration:const BoxDecoration( 
        gradient: LinearGradient(
          colors:[ Color.fromARGB(255, 91, 2, 55), Color.fromARGB(255, 24, 8, 168)],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight
           )
      ),
      child: screenWidget
  ),));
  }
}