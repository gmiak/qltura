import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/dimension.dart';

/// Responsive Layout provider

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // passed a web screen layout
        return webScreenLayout;
      }
      // If not, passed a mobile screen layout
      return mobileScreenLayout;
    });
  }
}
