import 'package:flutter/material.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobileScreenLayout.dart';
import 'package:qltura/client/service/config/responsiveLayout/responsive.dart';
import 'package:qltura/client/service/config/responsiveLayout/webScreenLayout.dart';
import 'client/service/utils/colors.dart';

void main() {
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
