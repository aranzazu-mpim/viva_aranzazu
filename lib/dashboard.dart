import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LayoutStarts());
  }
}

class LayoutStarts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[VivaAranzazuHeader()],
      ),
    );
  }
}

class VivaAranzazuHeader extends StatefulWidget {
  @override
  _VivaAranzazuHeaderState createState() => _VivaAranzazuHeaderState();
}

class _VivaAranzazuHeaderState extends State<VivaAranzazuHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 19, right: 19),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search, color: Colors.black),
                  Spacer(),
                  Text('VIVA ARANZAZU',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF3454))),
                  Text(' PH ', style: TextStyle(color: Color(0xffFF3454))),
                  Text('News',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                  Spacer(),
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage:
                        (NetworkImage('https://via.placeholder.com/150')),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
            // TODO: INSERT LIST VIEW
          ],
        )
      ],
    );
  }
}
