import 'package:flutter/material.dart';

class MyInvestments extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyInvestments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('My investments')),
    );
  }
}
