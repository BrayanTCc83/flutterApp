import 'package:flutter/cupertino.dart';

class ActivityCardColor{
  ActivityCardColor(){}
  final List<Color> cRed = [
    Color.fromRGBO(255, 85, 85, 1),
    Color.fromRGBO(255, 201, 207, 1)
  ];
  List<Color> get red {
    return cRed;
  }
  final List<Color> cBlue = [
    Color.fromRGBO(85, 114, 255, 1), 
    Color.fromRGBO(206, 212, 255, 1)
  ];
  List<Color> get blue {
    return cBlue;
  }
  final List<Color> cGreen = [
    Color.fromRGBO(42, 124, 62, 1),
    Color.fromRGBO(88, 240, 172, 1)
  ];
  List<Color> get green {
    return cGreen;
  }
  final List<Color> cBrown = [
    Color.fromRGBO(148, 129, 65, 1),
    Color.fromRGBO(240, 229, 200, 1)
  ];
  List<Color> get brown {
    return cBrown;
  }
  final List<Color> cGray = [
    Color.fromRGBO(75, 75, 75, 1),
    Color.fromRGBO(216, 216, 216, 1)
  ];
  List<Color> get gray {
    return cGray;
  }
  final List<Color> cYellow = [
    Color.fromRGBO(255, 188, 0, 1),
    Color.fromRGBO(239, 219, 160, 1)
  ];
  List<Color> get yellow {
    return cYellow;
  }
  final List<Color> cCyan = [
    Color.fromRGBO(50, 165, 183, 1),
    Color.fromRGBO(144, 236, 231, 1)
  ];
  List<Color> get cyan {
    return cCyan;
  }
  final List<Color> cPurple = [
    Color.fromRGBO(223, 68, 223, 1),
    Color.fromRGBO(246, 180, 248, 1)
  ];
  List<Color> get purple {
    return cPurple;
  }
  
  List<Color> getColorForName( String colorName ){
    List<Color> colors = ActivityCardColor().red ; 
    List< dynamic > colorList = [
      ['red','rojo', ActivityCardColor().red],
      ['blue','azul', ActivityCardColor().blue],
      ['green','verde', ActivityCardColor().green],
      ['brown','cafe', ActivityCardColor().brown],
      ['gray','gris', ActivityCardColor().gray],
      ['yellow','amarillo', ActivityCardColor().yellow],
      ['cyan','cian', ActivityCardColor().cyan],
      ['purple','morado', ActivityCardColor().purple],
    ];
    for( num i = 0; i < colorList.length; i++ ){
      if( 
          colorList[i][0] == colorName.toLowerCase() || 
          colorList[i][1] == colorName.toLowerCase() 
      ){
        colors = colorList[i][2];
      }
    }
    return colors;
  }
}