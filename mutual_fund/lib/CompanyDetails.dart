import 'package:flutter/material.dart';
import 'package:mutual_fund/datafile.dart';


class CompanyDetails extends StatefulWidget {
  List<HomeData> lst;
  int index;
  CompanyDetails({this.lst , this.index});
  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 17),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.network(widget.lst[widget.index].logoUrl,width: MediaQuery.of(context).size.width * 0.3,),
                    ],
                  ),
                  SizedBox(height:75,),
                  Row(
                    children: <Widget>[
                      Text(widget.lst[widget.index].name[0].toUpperCase() + widget.lst[widget.index].name.substring(1), style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400 ),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
