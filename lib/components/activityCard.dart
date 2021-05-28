import 'package:flutter/cupertino.dart';
import 'package:flutter_app_new/global/cardimages.dart';
class ActivityCard extends StatelessWidget{
  ActivityCard( {
      String title, 
      String content, 
      String date, 
      String hour,
      List<Color> color, 
      int imageIndex 
  } ){
    if( color != null ){
      this.color = color;
    }
    if( imageIndex != null ){
      this.imageIndex = imageIndex;
    }
    if( title != null ){
      this.title = title;
    }
    if( content != null ){
      this.content = content;
    }
    if( date != null ){
      this.date = date;
    }
    if( hour != null ){
      this.hour = hour;
    }
  }

  String title = "Title";
  String content = "Content";
  String date = "DD/MM/YYYY";
  String hour = "HH:MM";
  List<Color> color = [
    Color.fromRGBO(85, 114, 255, 1), 
    Color.fromRGBO(206, 212, 255, 1)
  ];
  int imageIndex = 1;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      width: 330,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children : [
          CardImage(imageIndex).getImage(),
          Container(
            width: 176,
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.title,
                  style: TextStyle( 
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
                Text(
                  this.content,
                  style: TextStyle( 
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 17
                  ),
                  maxLines: 4,
                  textAlign: TextAlign.left,
                ),
                Text(
                  this.date + "  -  " + this.hour,
                  style: TextStyle( 
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                )
              ],
            )
          )
        ]
      ),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color[0], color[1]
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight
        ),
        borderRadius: new BorderRadius.circular(25)
      ),
    );
  }
}