import 'package:mutual_fund/datafile.dart';
import 'package:mutual_fund/login_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:mutual_fund/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mutual_fund/navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email'
    ]
);

UserData User;

GoogleSignInAccount currentuser;


class Routing extends StatefulWidget {
  String userStatus;
  Routing(userstatus){
    userStatus = userstatus;
  }

  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void printuser(){
    print(widget.userStatus);
  }

  void _signinuser() async {
    currentuser = await _googleSignIn.signIn();
    SharedPreferences uservalue = await SharedPreferences.getInstance();
    setState(() {
      widget.userStatus = 'loggedin';
      uservalue.setString('username', currentuser.displayName);
      uservalue.setString('useremail', currentuser.email);
      uservalue.setString('userprofile', currentuser.photoUrl);
    });
  }

  void _signoutuser() async{
    currentuser = await _googleSignIn.signOut();
    SharedPreferences uservalue = await SharedPreferences.getInstance();
    setState(() {
      widget.userStatus = 'loggedout';
      uservalue.remove('username');
    });
  }


  @override
  Widget build(BuildContext context) {
      if(widget.userStatus  == 'loggedin') {
        return NavigationPage(signoutuser: _signoutuser);
      }else{
        return MyEntry(signinuser: _signinuser);
      }
  }
}


class UserData{
  GoogleSignInAccount currentuser;
  UserData({this.currentuser});
}