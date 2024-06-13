import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answerText,required this.onTab});
  final String answerText;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom( 
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        backgroundColor: const Color.fromARGB(255, 21, 21, 20),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

      ),
      onPressed: onTab,
           child: Text(answerText ,style: GoogleFonts.turretRoad( 
            color:Colors.white,
            fontSize:15
           ),textAlign: TextAlign.center));
  }
}

/*
akta reseable button banano hoice ai button dynamicly generate kora hobe 
button joto bar generate kora hobe sob khan e jano akoi model text ui same hoy tai 
aktai button k sob khan e babohar kora hocce.
*anserText and *onTab pass kora hoice jano text ontab fuction alada babohar kora jay.
add google fonts text gula k r o beshi valo dekhanor jonno.bivinno style korar jonno
 */