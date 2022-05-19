import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projnew/screens/buildcard.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Saving Reminder App'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF90E6FC),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[BuildCard(),
            SizedBox(height: 10),

            ElevatedButton(
              child: Text('Event calendar'),
              onPressed: () {Navigator.pushNamed(context, '/second');},
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              child: Text('Add your Goal Image'),
              onPressed: () {Navigator.pushNamed(context, '/fourth');},
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),

          ],
        ),
      ),

    );
  }

}