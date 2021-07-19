import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs extends ChangeNotifier {
  bool introShown = false;
  Future<bool> checkDisplay() async {
    final prefs = await SharedPreferences.getInstance();
    return introShown = prefs.getBool('introShown') ?? false;
  }

  Future<bool> setIntroShown() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('introShown', true);
    introShown = true;
    notifyListeners();
    return introShown;
  }
}
