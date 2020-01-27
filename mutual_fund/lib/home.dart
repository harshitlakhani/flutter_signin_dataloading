import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mutual_fund/datafile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mutual_fund/colors.dart';
import 'package:mutual_fund/CompanyDetails.dart';


import 'datafile.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: CardList(),
        builder: (BuildContext context,AsyncSnapshot lst){
          if(lst.data == null){
            return Center(
              child: SpinKitThreeBounce(
                color: HexColor('#122330').withOpacity(0.1),
                size: 20,
              ),
            );
          }
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: ListView.builder(
              itemCount: lst.data.length,
              itemBuilder: (BuildContext contex,int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,  MaterialPageRoute(builder: (context) => CompanyDetails(lst: list,index: index))
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: -4
                      )],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 17),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.network(lst.data[index].logoUrl,height: 30,width: 50,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('TTM', style: TextStyle(color: Colors.grey[400],fontSize: 12),),
                                  SizedBox(height: 10,),
                                  Text(lst.data[index].oneyearreturn + '%',style: TextStyle(color: HexColor("00C395"),fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(lst.data[index].name,style: TextStyle(fontSize: 15),),
                                    SizedBox(height: 5,),
                                    Text('Abn-Amro is a leading mutual fund managing comany.Abn-Amro is a leading mutual fund managing comany.',style: TextStyle(color: Colors.grey[400],fontSize: 12),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }
}



