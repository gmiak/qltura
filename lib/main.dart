import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qltura/client/service/config/provider/user_provider.dart';
import 'package:qltura/client/view/screens/start/start_screen.dart';
import 'client/service/config/responsiveLayout/mobile_screen_layout.dart';
import 'client/service/config/responsiveLayout/responsive.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qltura',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: appBackgroundColor),

        // Checking if the user has logged in or logged out
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // If user has logged in
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
                // The connection has been made but some error occured!
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            // If snapshot has no data (User maybe logged out)
            return const StartScreen();
          },
        ),
      ),
    );
  }
}
