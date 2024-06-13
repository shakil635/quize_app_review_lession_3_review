import 'package:flutter/material.dart';
import 'package:quize_app_lession_3_review/data/questions.dart';
import 'package:quize_app_lession_3_review/question_summary.dart';

class ResltScreen extends StatelessWidget {
  const ResltScreen({super.key,required this.chosenAnswer,required this.resetQuize});
  final void Function() resetQuize;

  final List<String> chosenAnswer;

 List<Map<String,Object>> get getSummryData{
  final List<Map<String,Object>> summary = [];
for(var i=0; i<chosenAnswer.length;i++){
  summary.add({
    "question_index":i,
    "questions":questions[i].text,
    "currect_answer":questions[i].answer[0],
    "user_answer":chosenAnswer[i]
  });
}
  return summary;
  }

/*
get use kore jodi function er parameter na...
getSummryData function return a list,list take a map.
akta for loop babohar kora hoice chosenAnswer list er upor.
summary list er modde add kora hocce akta map r map er prothom value i.
"questions" key index i er madhome question add kortese.
"currect_answer" key answer add kortese.0 index answer karon mul list tay 0 index e currect answer deya ase.
"user_answer" key deya user er deya answer gula neya hocce.

 */
  @override
  Widget build(BuildContext context) {

  // final summaryData = getSummryData();
 final numToatalQuestion=questions.length;

 final numCorrectQuestion=getSummryData.where((data){
return data["user_answer"]==data["currect_answer"];
 }).length;

/*
Your answred X out of  Y corrected!
x and y er value dorkar.
numToatalQuestion variable question list er modde thake sob question er length store kora hocce jar man Y.
*user koto gula complet korse oitar jonno summaryData list k filter kora hocce where deya.
user_answer r currect_answer length deya currect_answer  theke user koto gula currect korse ta dekha hocce 
and lastly ai length ta return kora hocce.

 */



    return SizedBox( 
      width: double.infinity,
      child: Container( 
        margin: const EdgeInsets.all(40),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
               Text("Your answred $numCorrectQuestion out of  $numToatalQuestion corrected!",
               style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              const SizedBox(height: 30,),
              QuestionSummary(getSummryData),
             const SizedBox(height: 30,),
             TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black
              ),
              onPressed: resetQuize
             ,
              child: const Text("Restat Quize!",))

          ],
        ),
      ),
    );
  }
}