
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mutual_fund/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';




final formkey = GlobalKey<FormState>();


GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email'
    ]
);

class MyEntry extends StatefulWidget {
  final VoidCallback signinuser;
  MyEntry({this.signinuser});
  @override
  _MyEntryState createState() => _MyEntryState();
}

class _MyEntryState extends State<MyEntry> {


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.purple[100]);
    return MyLoginRegister();
  }

  Widget MyLoginRegister(){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  'Sign In',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: largefont,
                     fontWeight: FontWeight.bold,
                     letterSpacing: 0.5,
                   ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Form(
                      key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                            onPressed: () {
                              widget.signinuser();
                            },
                            color: Colors.lightBlue[600],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Using Google',
                                      style: TextStyle(
                                        fontSize: mediumfont,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                  ],
                ),
              ),
              ),
            ],
            ),
          )
      );
  }
}

RegisterUser() async {
    try {
      GoogleSignInAccount _user = await _googleSignIn.signIn();
      print(_user);
    }catch(e){
      print(e);
    }
}


/*
setBoolValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  await prefs.setString('user', 'signedIn');

}*/
