
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mutual_fund/home.dart';

List<HomeData> list = List();

class HomeData {
  final String id;
  final String name;
  final String logoUrl;
  final String oneyearreturn;

  HomeData({this.id, this.name, this.logoUrl, this.oneyearreturn});

  factory HomeData.fromJson(Map<String, dynamic> json){
    return HomeData(
        id: json['id'],
        name: json['name'],
        logoUrl: json['logo'],
        oneyearreturn: json['one-year-returns'],
    );
  }
}


Future<List<HomeData>> CardList() async {
  final res = await http.get('https://mutualfund49.000webhostapp.com/get.php');
  if(res.statusCode == 200) {
    list = (json.decode(res.body) as List)
        .map((data) => new HomeData.fromJson(data))
        .toList();
  }
  return list;
}