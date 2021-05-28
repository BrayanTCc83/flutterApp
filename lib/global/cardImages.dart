import 'package:flutter/cupertino.dart';
List<String> imageAssetsList = [
  CardImage(1).getAsset(),
  CardImage(2).getAsset(),
  CardImage(3).getAsset(),
  CardImage(4).getAsset(),
  CardImage(5).getAsset(),
  CardImage(6).getAsset(),
  CardImage(7).getAsset(),
  CardImage(8).getAsset(),
  CardImage(9).getAsset(),
  CardImage(10).getAsset(),
  CardImage(11).getAsset(),
  CardImage(12).getAsset(),
  CardImage(13).getAsset(),
  CardImage(14).getAsset(),
  CardImage(15).getAsset(),
  CardImage(16).getAsset(),
  CardImage(17).getAsset(),
  CardImage(18).getAsset(),
];
List<String> imageAssetsNames = [
  'Lectura 1',
  'Lectura 2',
  'Lectura 3',
  'Lectura 4',
  'Jardineria',
  'Trabajo digital',
  'Musica',
  'Comida',
  'Correr 1',
  'Correr 2',
  'Beisball',
  'Tenis 1',
  'Tenis 2',
  'Yoga',
  'Box',
  'Futball',
  'Ejercicio',
  'Basquetball'
];
class CardImage {
  int value;
  double width = 130;
  CardImage( this.value );
  Image getImage(){
    return Image(
      image : AssetImage( 'assets/icons/H''${value}''.png' ),
      width: width
    );
  }
  void setWidth( double width){
    this.width = width;
  }
  String getAsset(){
    return 'assets/icons/H${value}.png';
  }
}