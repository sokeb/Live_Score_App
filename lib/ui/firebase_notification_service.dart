import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  FirebaseNotificationService._();

  static final FirebaseNotificationService instance = FirebaseNotificationService._();



  Future<void> initialize() async{
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
    FirebaseMessaging.onMessage.listen((RemoteMessage message){


    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){

    });

    FirebaseMessaging.onBackgroundMessage(doNothing);
    String? token = await getToken();
    print(token);
  }

  Future<String?> getToken() async{
    String? token = await _firebaseMessaging.getToken();
    return token;
  }

}


Future<void> doNothing(RemoteMessage message) async{

}