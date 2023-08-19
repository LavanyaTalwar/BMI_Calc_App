import 'package:flutter/material.dart';
import 'bmi.dart';

main(){
  debugShowCheckedBanner:false;
  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext){
    return MaterialApp(
      home:BMI(),
    );
  }
}

class DashBoardScreen extends StatelessWidget{
  var name=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('AppBar'),),
      body: Text('hello'),
    );
  }

}