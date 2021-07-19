import 'package:flutter/material.dart';
import 'package:gibbly/providers/prefs.dart';
import 'package:gibbly/screens/intro.dart';
import 'package:gibbly/screens/home.dart';
import 'package:gibbly/config/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GibblyApp());
}

class GibblyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SafeArea(
        child: ChangeNotifierProvider.value(
          value: Prefs(),
          child: _LoadApp(),
        ),
      ),
    );
  }
}

class _LoadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _prefs = Provider.of<Prefs>(context, listen: false);
    final Widget _showPage = Consumer(
      builder: (context, Prefs value, child) {
        if (value.introShown == true) {
          return HomePage();
        } else {
          return IntroPage();
        }
      },
    );
    return FutureBuilder(
      future: _prefs.checkDisplay(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return HomePage();
        } else {
          return _showPage;
        }
      },
    );
  }
}
