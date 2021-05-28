import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_new/global/colors.dart';

Container newTextfield({String hintText, String title, int maxLines, int maxLength, Function(String) onChange}){
  int maxLinesReal = 1;
  if( maxLines != null ){
    maxLinesReal = maxLines;
  }
  int maxLengthReal = 50;
  if( maxLength != null ){
    maxLengthReal = maxLength;
  }
  return 
  Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child : TextField(
      maxLines: maxLinesReal,
      maxLength: maxLengthReal,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20
        ),
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        labelText: title
      ),
      onChanged: onChange,
    )
  );
}
BoxDecoration setDecorationGradient(String value){
  BoxDecoration decoration;
  decoration = new BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ActivityCardColor().getColorForName(value)[0],
        ActivityCardColor().getColorForName(value)[1]
      ],
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight
    ),
    borderRadius: new BorderRadius.circular(5)
  );
  return decoration;
}
BoxDecoration setDecorationImg(List<String> backImgs, int index) {
  BoxDecoration decoration;
  decoration = new BoxDecoration( 
    image: DecorationImage( image: AssetImage( backImgs[index] ) ),
    borderRadius: new BorderRadius.circular(5)
  );
  return decoration;
}
List<String> backgroundType = [ 'img', 'gradient' ];
DropdownButton createDropDownButton( {
    List<String> items, 
    Function(String) onChange, 
    String backgroundType,
    List<String> backImgs,
    String hintText
}){
  List<String> itemsR = items != null ? items : ["Item"];
  int index = 0;
  return DropdownButton<String>(
    focusColor:Colors.white,
    style: TextStyle(color: Colors.white, fontSize: 20),
    iconEnabledColor:Colors.black,
    items: itemsR.map<DropdownMenuItem<String>>((String value) {
      index ++;
      return DropdownMenuItem<String>(
        value: value,
        child: Row(
          children : [
            Container(
              width: 60,
              height: 30,
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              decoration: backgroundType == 'gradient' ?
                setDecorationGradient( value ) : setDecorationImg( backImgs, index - 1 )
            ),
            Text(value,style:TextStyle(color:Colors.black, fontSize: 20),)
          ]
        )
      );
    }).toList(),
    hint:Text(
      hintText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500),
    ),
    onChanged: onChange ,
  );
}