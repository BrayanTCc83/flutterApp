import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class FileReadWrite{
  String _fileName = '';

  FileReadWrite( this._fileName );
  FileReadWrite.toReadDirectory();
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }
  Future<File> writeFile(String fileContent) async {
    final file = await _localFile;
    return file.writeAsString( fileContent );
  }
  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }
  void readFileList(String name, final Function(String) toGet) async {
    final directory = await getApplicationDocumentsDirectory();
    print(" Aqui si entra ");
    directory.list().forEach((element) { 
      int length = element.path.split('/').length;
      String fileName = element.path.split('/')[length-1];
      if( fileName.split('.')[0].startsWith( name ) ){
        FileReadWrite fileReader = new FileReadWrite( fileName );

        Future<String> fileResult = fileReader.readFile();
        fileReader.readFileResult(fileResult, toGet); 
      }
    });
  }
  Future<int> getDirectoryLength() async{
    print( 'Numeros' );
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    print(directory.list().length);
    return directory.list().length;
  }
  void getFileNumbers( Future<int> length, Function(int) toGet ){
    print( 'Trabajando el numero' );
    length.then((value) => toGet( value ));
  }
  void readFileResult( Future<String> value, Function(String) toGet ){
    value.then((newValue) => toGet( newValue ) );
  }
}