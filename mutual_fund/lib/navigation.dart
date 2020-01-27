import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutual_fund/colors.dart';
import 'package:mutual_fund/home.dart';
import 'package:mutual_fund/myinvestments.dart';
import 'package:mutual_fund/profile.dart';
import 'package:mutual_fund/fedindexedstack.dart';


int _navigationIndex = 0;


class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('',Icons.home, Colors.teal),
  Destination('',Icons.account_balance_wallet, Colors.cyan),
  Destination('',Icons.account_circle, Colors.orange),
];



void colours(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
  ));
}
class NavigationPage extends StatefulWidget {
  final VoidCallback signoutuser;
  NavigationPage({this.signoutuser});


  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationIndex = 0;
    colours();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _navigationIndex,
          children: <Widget>[
            MyHomePage(),
            MyInvestments(),
            MyProfile(signoutuser: widget.signoutuser),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false ,
            iconSize:25,
            backgroundColor: HexColor('#122330'),
            fixedColor: Colors.white.withOpacity(1),
            unselectedIconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.1),
            ),
            currentIndex: _navigationIndex,
            onTap: (int index){
              print(index);
              setState(() {
                _navigationIndex = index;
              });
            },
            items:  allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  title: Text(destination.title)
              );
            }).toList(),
          ),
        ) ,
      ),
    );
  }
}
