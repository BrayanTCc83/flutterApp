
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_new/components/activityCard.dart';
import 'package:flutter_app_new/functions/files.dart';
import 'package:flutter_app_new/global/cardImages.dart';
import 'package:flutter_app_new/global/colors.dart';
import 'package:flutter_app_new/screen/createCardScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState( title : this.title );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
  }

  _MyHomePageState({this.title}){
    readActivities();
  }

  bool _isVisible = false;
  
  final String title;

  void _openCreateNew() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateActivityCard(title: 'Crear actividad',)
      )
    );
  }
  Color parseStringToColor(String strColor){
    String valueString = strColor.split('(0x')[1].split(')')[0]; // kind of hacky..
    int colorState = int.parse(valueString, radix: 16);
    Color otherColor = new Color(colorState);
    return otherColor;
  }
  List<ActivityCard> activities = [];
  void activitiesAdd(String value){
    Map<String, dynamic> result = json.decode(value);
    List<Color> colors = [
      parseStringToColor(result['color'][0]), 
      parseStringToColor(result['color'][1])
    ];
    setState(() {
      activities.add( new ActivityCard(
        color: colors,
        content: result['content'],
        date: result['date'],
        hour: result['hour'],
        imageIndex: imageAssetsNames.indexOf(result['image']),
        title: result['title'],
      ) );
    });
  }
  void readActivities(){
    FileReadWrite fileReader = new FileReadWrite.toReadDirectory();
    fileReader.readFileList( 'activity', activitiesAdd );
  }
  @override
  Widget build(BuildContext context) {
    var colors = ActivityCardColor();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(10, 10, 10,1)
        ),
      ),
      body: 
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: activities,
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: this._openCreateNew,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}