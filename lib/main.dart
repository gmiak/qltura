import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobile_screen_layout.dart';
import 'package:qltura/client/service/config/responsiveLayout/responsive.dart';
import 'package:qltura/client/service/config/responsiveLayout/web_screen_layout.dart';
import 'client/service/config/responsiveLayout/web_screen_layout.dart';
import 'client/service/utils/colors.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC5bbw9fyheEmrM8RXrWPDxzLdeIBvxlEI",
          appId: "1:974107373016:web:a6dc1640e15e7dd42a56ad",
          messagingSenderId: "974107373016",
          projectId: "qltura-35db9",
          storageBucket: "qltura-35db9.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }

  // Run the App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qltura',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
