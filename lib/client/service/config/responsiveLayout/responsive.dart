import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qltura/client/service/utils/global_variables.dart';

import '../provider/user_provider.dart';

/// Responsive Layout provider

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  fetchUserData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // passed a web screen layout
        return widget.webScreenLayout;
      }
      // If not, passed a mobile screen layout
      return widget.mobileScreenLayout;
    });
  }
}
