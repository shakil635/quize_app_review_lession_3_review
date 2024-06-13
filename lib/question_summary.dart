import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String,Object>> summaryData ;

  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column( 
          children: summaryData.map((data){
             bool isCorrect = data["currect_answer"] == data["user_answer"];
             //set a boolian isCorrect, currect_answer and user_answer equal user koto gula correct answer dwy tar track rakhar jonno booain deya hoice.

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //crossAxisAlignment deya row and colum er modde thaka sob gula k start theke suru korano hoice
              
              children: [ 
              
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar( 
                // CircleAvatar deya index 1,2,3number gula k akta circle er modde bosano hoice
                  radius: 20,
                  backgroundColor: isCorrect  ? Colors.blue : Colors.red,
                //jodi sotik answer hoy tahole CircleAvatar blue hohe sotik na hole red hobe
                  child:Text(((data["question_index"] as int) + 1 ).toString()), 
                ),
              ),
              
              Expanded(
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text(data["questions"] as String,         
                    style: GoogleFonts.aBeeZee( 
                      color:Colors.white,
                      fontSize:20,
                      fontWeight:FontWeight.bold
                      
                    ),),
                    const SizedBox(height: 5),
                    Text(data["currect_answer"] as String,
                    style: GoogleFonts.abel( 
                      color: Colors.blue ,
                       fontSize:15
                 
                    ),
                    
                    ),
                    Text(data["user_answer"] as String,
                  
                    style: GoogleFonts.abel( 
                      color:isCorrect  ? Colors.blue : Colors.red,
                      fontSize:15
                 
                    ),),
                  ],
                ),
              )
        
          
            ],);
          },).toList()
        ),
      ),
    );
  }
}

/*

video number 88 te get neya kotha bolce aita r aktu clear defenation lagbe.



notun akta widget banano hoice data gula k summary korar jonno.

result screen theke summaryData list er madhome data gula ai widget e ana hocce.
data k prothom e type cust er madhome int e tar por abar string e convert kora hoice.
onek vabe typer cast kora jay: as/tryprase/prase/.toString/.toInt etc.
sizedBox deya akta nirdisto jaygha (300 pixccel) kore deya hoice.
SingleChildScrollView deya scrollable banano hoice jate user scroll korte pare.
Text(((data["question_index"] as int) + 1 ).toString()), +1 deyar karon
index 0 theke suru hoy tai user k 1,2,3 ai serial dekhanor jonno +1 deya hoice.



 */




