import 'package:flutter/material.dart';
class Calculator with ChangeNotifier {
  int _month = 0;
  double _amount = 0;
  double _interest =0;
  DateTime _selectdate = DateTime.now();
  List <DateTime> _listDate = [];

  double get interest=> _interest ;
  void setInterest (value) {
    _interest = value;
    notifyListeners();
  }
  double get amount=> _amount ;
  void setAmount (value) {
    _amount = value;
    notifyListeners();
  }
  int get month => _month ;
  void setMonth (value){
    _month = value ;
    notifyListeners();
  }
  DateTime get selectdate=> _selectdate ;
  void setSelectdate(value) {
    _selectdate = value;
    notifyListeners();
  }
  List<DateTime> get listDate=> _listDate ;
  void setlistDate (date) {
    _listDate.add(date);
    notifyListeners();
  }
}
