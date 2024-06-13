class QuizeQuestion{
const
QuizeQuestion(this.text,this.answer);

final String text;
final List<String> answer;

List<String> getShuffledAnswer(){
  final shaffledList = List.of(answer);
  shaffledList.shuffle();
  return shaffledList;
}

}
/*
QuizeQuestion ta blue print ki vabe 
data gula show korano jay tar akta mode ba fame banano hoice.
ai model ba fame onujay data show kora no hobe.

*getShuffledAnswer akta method ja akta list k return kora
*list.of deya mul list er akta copy banano hoice shaffledList
*shuffle method er madhome copy list er record gula k randomly ger=nerate kora hocce
 */