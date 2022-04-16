import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}
TextEditingController goalname_Controller = new TextEditingController();
TextEditingController goaldescription_Controller = new TextEditingController();
TextEditingController hourController = TextEditingController();
TextEditingController minuteController = TextEditingController();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'money save alarm',
      //TODO 1:  Update Route Table HERE
      initialRoute: "/",

      routes:{
        // When n a vi g a ti n g t o the ” / ” r ou te ,
        // b uil d the F i r s t S c r e e n wid ge t .
        "/" : (context) => const FirstScreen(),
        // When n a vi g a ti n g t o the ” / sec ond ” r ou te ,
        // b uil d the Sec ondSc reen wid ge t .
        "/second" : (context) => const SecondScreen(),
        "/third" : (context) => const ThirdScreen(),

      },
    );
  }
}
//------------------------------------------------------------------------------------------------------------------------
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Money Saving Reminder',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              //child: MyStatefulWidget(),
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/lake.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 400,
            ),
            SizedBox(
              height: 10,
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");

              },
              child: const Text('Reminder setting'),
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");

              },
              child: const Text('Add Goal Description'),
            ),
          ],
        ),
      ),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: 'Repeat every day?',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },

    );
  }
}

//-----------------------[SECOND SCREEN]---------------------------------------------------------------------------------------
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Reminder setting',
                style: TextStyle(fontSize: 40),
              ),

              SizedBox(
                //child: MyStatefulWidget(),
              ),
              Text(
                'Time setting',
                style: TextStyle(fontSize: 20,color: Colors.lightGreen),
//child: MyStatefulWidget(),
              ),
              SizedBox(
                child: MyStatefulWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(11)),
                    child: Center(
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(11)),
                    child: Center(
                      child: TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create alarm',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    int hour;
                    int minutes;
                    hour = int.parse(hourController.text);
                    minutes = int.parse(minuteController.text);

                    // creating alarm after converting hour
                    // and minute into integer
                    FlutterAlarmClock.createAlarm(hour, minutes);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // show timers
                  FlutterAlarmClock.showTimers();
                },
                child: Text(
                  "Show Timers",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  // TODO 3: Update code to return to FirstScreen Pop()
                  Navigator.pop(context);
                },
                child: const Text("Back to homepage"),
              ),
            ],
          )
      ),
    );
  }
}



//-----------------------[Third SCREEN]---------------------------------------------------------------------------------------
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Add Goal description',
                style: TextStyle(fontSize: 40),
              ),
              TextFormField(
                controller: goalname_Controller,
                obscureText: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Your Goal Name is.....',
                ),
              ),
              TextFormField(
                controller: goaldescription_Controller,
                obscureText: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Your Goal descrption is....',

                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  // TODO 3: Update code to return to FirstScreen Pop()
                  Navigator.pop(context);
                },
                child: const Text("save and back to homepage"),
              ),
            ],
          )
      ),
    );
  }
}

