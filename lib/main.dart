import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ileiwe/cores/routes.dart';
import 'package:ileiwe/cores/themes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: FToastBuilder(),
      title: 'Ile Ire',
      theme: fontTheme(),
      
      debugShowCheckedModeBanner: false,
      routerConfig: router,     
    );
  }
}
