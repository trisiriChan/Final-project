import 'package:flutter/material.dart';


class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Padding(
        padding: EdgeInsets.all(8.0),
  child: Column(
        children: [
             TextField(
                decoration: InputDecoration(
                    hintText: "type your data",
                    labelText: "Desciption",
                    labelStyle:  TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    )

                )  ,
                obscureText: false,
                maxLength: 300,
                maxLines: 3,
              )


        ],
      ),
        ),
    );

  }
}
