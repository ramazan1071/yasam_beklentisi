import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class MyColumn extends StatelessWidget {
  final IconData? icon;
  final String? cinsiyet;

  MyColumn(
      {this.icon = FontAwesomeIcons.addressBook,
      this.cinsiyet = "Default",
      Color? renk});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text("$cinsiyet", style: kMetinStili),
      ],
    );
  }
}
