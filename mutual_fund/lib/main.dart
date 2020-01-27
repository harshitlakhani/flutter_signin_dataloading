
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutual_fund/main_rout.dart';
import 'package:mutual_fund/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mutual_fund/datafile.dart';

String  _userstatus;

GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email'
    ]
);



void main() 
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     //or set color with: Color(0xFF0000FF)
  ));


  return runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mutual Fund',
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentuser();

  }

  currentuser()async{
    SharedPreferences uservalue = await SharedPreferences.getInstance();
    if(uservalue.getString('username') != null){
      setState(() {
        _userstatus = 'loggedin';
      });
    }else{
      setState(() {
        _userstatus = 'loggedout';

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mutual Fund',
      color: HexColor('#122330'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textTheme: TextTheme(
            headline: TextStyle(
              fontSize: 20.0,
            ),
            body1: TextStyle(
              fontFamily: '',
            )
        ),
      ),
      home: Routing(_userstatus),

    );
  }
}



