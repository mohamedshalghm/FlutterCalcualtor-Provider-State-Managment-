import 'package:flutter/material.dart';

class ClaculatorNotifier with ChangeNotifier {
  String res = "0.0";
  String get getRes => res; 
  void sumNotifier(double n1, double n2) {
    res = (n1 + n2).toString();
    notifyListeners();
  }

  void divNotifier(double n1, double n2) {
    res = (n1 / n2).toString();
    notifyListeners();
  }

  void multiNotifier(double n1, double n2) {
    res = (n1 * n2).toString();
    notifyListeners();
  }

  void subNotifier(double n1, double n2) {
    res = (n1 - n2).toString();
    notifyListeners();
  }

  void modNotifier(double n1, double n2) {
    res = (n1 % n2).toString();
    notifyListeners();
  }
}
