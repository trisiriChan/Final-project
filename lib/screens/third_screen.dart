import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projnew/providers/calculator.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Saving Calculator'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF90E6FC),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset( 'assets/money-saving.jpg'),
            ),
            MyStatefulWidget(),
            Text('If you want to saved in (${context.watch<Calculator>().month}) Month'),
            Text('You have to save (${((context.watch<Calculator>().amount/context.watch<Calculator>().month)*(1+(context.watch<Calculator>().interest/100))).toStringAsFixed(2)})per month'),
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
  double _currentSliderValue = 20;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  DateTime currentDate = DateTime.now();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });print(currentDate);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('  Price'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: myController,
            onChanged: (text) {
              context.read<Calculator>().setAmount(double.parse(myController.text));
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter money Amount you want to save',
            ),

          ),
        ),
        Text('  Interest'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: myController2,
            onChanged: (text) {
              context.read<Calculator>().setInterest(double.parse(myController2.text));
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter interest(default 0%)',
            ),

          ),
        ),
            Slider(
            value: _currentSliderValue,
    min: 1,
    max: 72,
    divisions: 71,
    label: _currentSliderValue.round().toString(),
    onChanged: (double value) {
    setState(() {
    _currentSliderValue = value;
    });
    context.read<Calculator>().setMonth(value.toInt());
    },
    ),
        RaisedButton(
          onPressed: () => _selectDate(context),
          child: Text('Select date'),
        ),
      ],
    );
  }
}
