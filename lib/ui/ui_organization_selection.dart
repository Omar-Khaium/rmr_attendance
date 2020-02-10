import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rmr_attendance/model/company.dart';
import 'package:rmr_attendance/services.dart';
import 'package:rmr_attendance/ui/ui_dashboard.dart';

class ChooseOrganizationUI extends StatefulWidget {

  @override
  _ChooseOrganizationUIState createState() => _ChooseOrganizationUIState();
}

class _ChooseOrganizationUIState extends State<ChooseOrganizationUI> {
  var _future;
  List<Company> _list;
  @override
  void initState() {
    super.initState();
    _future = getData();
    _list = [];
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent.shade700,
          title: Text("Choose a company", style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),),
          leading: Container(),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot){
              if(snapshot.hasData) {
                return ListView.separated(itemBuilder: (context, index){
                  Company company = _list[index];
                  return ListTile(
                    title: Text(company.text, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black),),
                    leading: Icon(Icons.domain),
                    trailing: company.selected ? Icon(Icons.check_circle) : Container(),
                  );
                }, separatorBuilder: (context, index){
                  return Divider();
                }, itemCount: _list.length);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  getData() async {
    String token = await FlutterSecureStorage().read(key: "token");
    String email = await FlutterSecureStorage().read(key: "email");
    Map<String,String> headers = {
      'Authorization' : token,
      'Username' : email,
    };
    var response = await userByEmailService(headers);
    if(response.statusCode==200) {
      var map = json.decode(response.body);
      await FlutterSecureStorage().write(key: "user",value:  map.toString());
      var organizations = await getOrganizations(token);
      if(organizations==null) return [];
      else {
        List<Map<String, dynamic>> list = [];
        for (Map<String, dynamic> _mapItem in organizations['orglist']) {
          _list.add(Company.fromJson(_mapItem));
        }

        if(_list.length==1){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashboardUI()));
        }

        return list;
      }
    } else return [];
  }

  getOrganizations(token) async {
    Map<String,String> headers = {
      'Authorization' : token,
    };
    var response = await companyListService(headers);
    if(response.statusCode==200) return json.decode(response.body);
    else return null;
  }
}
