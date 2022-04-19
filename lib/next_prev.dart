import 'package:flutter/material.dart';

class NextPrevious extends StatelessWidget {
  final String text_to_display;
  final VoidCallback incOrDec;
  NextPrevious(this.text_to_display, this.incOrDec);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue,),
        onPressed: incOrDec, child: Text(text_to_display, style: TextStyle(color: Colors.black),),)
    );
  }
}
