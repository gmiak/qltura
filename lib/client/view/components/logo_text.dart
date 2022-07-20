import 'package:flutter/material.dart';

import '../../service/utils/colors.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Qltura",
      style: TextStyle(color: logoColor, fontFamily: 'Rochester', fontSize: 64),
    );
  }
}
