import 'package:flutter/material.dart';
import 'package:rmr_attendance/ui/ui_laucher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SafeArea(child: new LauncherUI()),
    );
  }
}