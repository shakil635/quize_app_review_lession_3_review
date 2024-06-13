

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget{
const  StartScreen(this.startQuize,{super.key});

final void Function() startQuize;
//startQuize filed er madhome  lifting state kora hocce ai state er kaj k niya quize_screen er modde kora hocce

@override
Widget  build(context){

  return Center(
    child: Column( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        Image.asset("assets/logo/quiz-logo.png",width: 300,),
        //opacity widget babohar kore image er visiable and nonvisiable korta jay,widget er color proparty babohar kore o kora jay
       const SizedBox(height: 70,),
        Text("Learn Flutter fun way!",style: GoogleFonts.aBeeZee(fontSize: 24,color: Colors.white),),
       const SizedBox(height: 30,),
       //sized box babohar kora hoice prottekta widget er distance    baranor jonno
        OutlinedButton.icon(

          onPressed: startQuize,
          // startQuize function k ai khan e babohar kora hoce

        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white
          
        ),
        icon:const Icon(Icons.arrow_right_alt),
         label:const Text("Start Quize!"))
      ],
    ));

  }
}





