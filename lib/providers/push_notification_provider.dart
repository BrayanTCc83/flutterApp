import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class PushNotificationProvider{   
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  
  initNotifications(){
    _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then( (token) {
      print( "============= FCM TOKEN ==========" );
      print(token);
    } );
  }

}