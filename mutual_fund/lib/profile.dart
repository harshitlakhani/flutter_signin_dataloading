import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutual_fund/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


String _profileUrl;
String _profileName;
String _profileEmail;

class MyProfile extends StatefulWidget {
  VoidCallback signoutuser;
  MyProfile({this.signoutuser});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  void getProfile() async{
    SharedPreferences user =  await SharedPreferences.getInstance();
    _profileUrl = user.getString('userprofile');
    _profileName = user.getString('username');
    _profileEmail = user.getString('useremail');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit : BoxFit.fill,
                        image: NetworkImage(_profileUrl)
                    )
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_profileName, style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text(_profileEmail, style: TextStyle(color: Colors.grey[400],fontSize: 13),)
                ],
              ),
            ],
          ),
          Row(

            children: <Widget>[
              FlatButton(
              onPressed: (){
                widget.signoutuser();
              },
              color: HexColor('#67CF2F'),
              child: Text('logout'),
        ),
            ],
          ),

        ],
      ),
      ),
    );
  }
}