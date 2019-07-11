import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(17.5, 25, 0, 0),
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(17.5, 90, 0, 0),
                child: Text(
                  'There',
                  style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(205, 90, 0, 70),
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              TextField(
                //TODO: IMPLEMENT DATA VALIDATION
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  //TODO: IMPLEMENT DATA VALIDATION
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                obscureText: true,
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  print("Tapped on Register button");
                  //TODO: REGISTER TO FIREBASE DATABASE
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
