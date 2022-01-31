import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key, required this.icon, required this.title})
      : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/$icon.png',
          height: 24,
          width: 24,
        ),
        const SizedBox(height: 2),
        Expanded(
          child: Text(
            title,
            style: AmbulanceTextStyle.sfW500S15,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
