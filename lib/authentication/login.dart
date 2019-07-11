import 'package:flutter/material.dart';
import 'package:viva_aranzazu/authentication/signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      'Viva',
                      style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(17.5, 90, 0, 0),
                    child: Text(
                      'Aranzazu',
                      style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(327.5, 90, 0, 70),
                    child: Text(
                      '!',
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
                    //TODO: IMPLEMENT DATA VALIDATION
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'MontSerrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    obscureText: true,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 25, left: 20),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
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
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("Tapped on Login button");
                      //TODO: LOGIN ON FIREBASE DATABASE
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      child: Container(
                        height: 50,
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child:
                                  ImageIcon(AssetImage('assets/facebook.png')),
                                ),
                                Center(
                                  child: Text(
                                    'Login with Facebook',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Tapped on Facebook');
                        //TODO: LOGIN USING FACEBOOK
                      }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("You don't have any account?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    )),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
