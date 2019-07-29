import 'package:flutter/material.dart';
import 'dashboard/updates.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //TODO: IMPLEMENT PAGE NAVIGATION
  //TODO: IMPLEMENT A CHECK IF USER IS LOGGED IN
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutStarts(),
    );
  }
}

class LayoutStarts extends StatefulWidget {
  @override
  _LayoutStartsState createState() => _LayoutStartsState();
}

class _LayoutStartsState extends State<LayoutStarts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: IMPORT ANY SCREEN YOU WANT TO TEST
        );
  }
}
