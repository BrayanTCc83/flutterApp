import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_new/functions/common.dart';
import 'package:flutter_app_new/functions/files.dart';
import 'package:flutter_app_new/global/cardImages.dart';
import 'package:flutter_app_new/global/colors.dart';
class CreateActivityCard extends StatefulWidget{
  CreateActivityCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateActivityCardState createState() => _CreateActivityCardState( title : this.title );
}

class _CreateActivityCardState extends State<CreateActivityCard>{
  _CreateActivityCardState({ this.isVisible, this.title }){
    print( isVisible );
  }

  bool isVisible = false;
  final String title;
  Future<DateTime> date;
  String stringFormatDate = 'YYYY / MM / DD';
  Future<TimeOfDay> time;
  String stringFormatTime = 'HH : MM';
  List<Color> cardColor = [];
  BoxDecoration getDecorationBox;
  String cardImage = '';
  BoxDecoration getCardImage;
  String cardTitle = '';
  String cardContent = '';
  
  List<Color> color = [
    Color.fromRGBO(85, 114, 255, 1), 
    Color.fromRGBO(206, 212, 255, 1)
  ];
  DateTime parseStringDate(DateTime date){
    setState((){
      stringFormatDate = '${date.year} / ${date.month} / ${date.day}' ;
    });
    return date;
  }
  TimeOfDay parseStringTime(TimeOfDay time){
    setState((){
      stringFormatTime = '${time.hour} : ${time.minute}' ;
    });
    return time;
  }
  void datePick(BuildContext context){
    date = showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate:
          new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
      confirmText: 'CONFIRMAR',
    );
    date.then((value) => parseStringDate(value));
  }
  void timePick(BuildContext context){
    time = showTimePicker(
      context : context, 
      initialTime: TimeOfDay(hour: 00, minute: 00),
      confirmText: 'FIJAR HORA'
    );
    time.then((value) => parseStringTime(value));
  }
  void setCardColor(String val){
    setState(() {
      cardColor = ActivityCardColor().getColorForName(val);
      getDecorationBox = setDecorationGradient(val);
    }); 
  }
  void setCardImage(String val){
    for (var i = 0 ; i < imageAssetsNames.length; i++) {
      if( imageAssetsNames[i] == val ){
        setState(() {
          cardImage = val;
          getCardImage = setDecorationImg(imageAssetsList, i );
        });
        break;
      }
    }
  }
  
  void save(){
    Map<String, dynamic> cardData = {
      'title' : cardTitle,
      'content' : cardContent,
      'image' : cardImage,
      'color' : [cardColor[0].toString(), cardColor[1].toString()],
      'date' : stringFormatDate,
      'hour' : stringFormatTime
    };
    FileReadWrite fs = FileReadWrite.toReadDirectory();
    fs.getFileNumbers( fs.getDirectoryLength(), (int number) {
      FileReadWrite fileReader = new FileReadWrite('activity$number.txt');
      fileReader.writeFile( json.encode(cardData) );
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(10, 10, 10,1)
        ),
      ),
      body: Center(
        child : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newTextfield( 
                  hintText : 'Ingresa el titulo de la actividad', 
                  title : 'Actividad',
                  onChange: (String title){
                    setState(() {
                      cardTitle = title;
                    });
                  }
                ),
                newTextfield( 
                  hintText : 'Ingresa una breve descripción', 
                  title : 'Contenido', 
                  maxLines: 6, 
                  maxLength: 250,
                  onChange: (String content){
                    setState(() {
                      cardContent = content;
                    });
                  }
                ),
                Row(
                  children: [
                    Container( 
                      width: 100,
                      height: 50,
                      decoration: getDecorationBox,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    createDropDownButton(
                      hintText: "Color de la carta",
                      backgroundType: backgroundType[1],
                      items: [
                        'Rojo',
                        'Azul',
                        'Verde',
                        'Cafe',
                        'Gris',
                        'Amarillo',
                        'Cian',
                        'Morado'
                      ], 
                      onChange: setCardColor
                    )
                  ],
                ),
                Row(
                  children: [
                    Container( 
                      width: 100,
                      height: 50,
                      decoration: getCardImage,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    createDropDownButton(
                      hintText: cardImage != '' ? cardImage :  "Imagen de la carta",
                      backgroundType: backgroundType[0],
                      items: imageAssetsNames,
                      backImgs: imageAssetsList,
                      onChange: setCardImage
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Fecha : ',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    Container(
                      width: 200,
                      child: 
                        Text(
                          stringFormatDate,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                    ),
                    new Builder(
                      builder: (context) => new FloatingActionButton(
                        child: new Icon(Icons.date_range),
                        onPressed: () => datePick(context)
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Hora : ',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    Container(
                      width: 210,
                      child: 
                        Text(
                          stringFormatTime,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                    ),
                    new Builder(
                      builder: (context) => new FloatingActionButton(
                        child: new Icon(Icons.timer),
                        onPressed: () => timePick(context)
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: 
                        TextButton(
                          style: TextButton.styleFrom( 
                            backgroundColor: Colors.blue, 
                            shadowColor: Colors.black45, 
                            elevation: 5,
                            padding: EdgeInsets.symmetric(vertical:10, horizontal: 60)
                          ),
                          child: Text( 'RESET', style: TextStyle(color: Colors.white, fontSize: 16), ),
                          onPressed: () {
                            setState(() {
                              cardColor = [];
                              cardImage = '';
                              cardTitle = '';
                              cardContent = '';
                              stringFormatDate = 'YYYY / MM / DD';
                              stringFormatTime = 'HH : MM';
                              getDecorationBox = null;
                              getCardImage = null;
                            });
                          }
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: 
                        TextButton(
                          style: TextButton.styleFrom( 
                            backgroundColor: Colors.blue, 
                            shadowColor: Colors.black45, 
                            elevation: 5,
                            padding: EdgeInsets.symmetric(vertical:10, horizontal: 43)
                          ),
                          child: Text( 'GUARDAR', style: TextStyle(color: Colors.white, fontSize: 16), ),
                          onPressed: save
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}