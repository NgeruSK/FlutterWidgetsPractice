import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text_to_display;
  final VoidCallback inc;
  AnswerButton(this.text_to_display, this.inc);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(40),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue,),
          onPressed: inc, child: Text(text_to_display, style: TextStyle(color: Colors.white),),),
      )
    );
  }
}
