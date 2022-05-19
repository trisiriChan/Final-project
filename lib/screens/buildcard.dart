import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String link = 'third_screen';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/third');
        },
        child:
        Card(
          child:Container (
            width: 130,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://icons.iconarchive.com/icons/dtafalonso/android-lollipop/512/Calculator-icon.png"),
              ),
            ),
          ),
        ),
    );


  }

}