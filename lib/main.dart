import 'package:flutter/material.dart';
import 'package:viva_aranzazu/data/model/ui/search/search_page.dart';
import 'package:viva_aranzazu/injection_container.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SearchPage());
  }
}
