import 'dart:convert';

import 'package:flutter/cupertino.dart';


class CounterViewModel extends ChangeNotifier{

  List foodList = [];

int countery = 0;
int get counter => countery;

   incrementCounter(){
     countery++;
     notifyListeners();
  }
  incrementCounterRemove(){
     if(countery>0)
     countery--;
     notifyListeners();
  }


}