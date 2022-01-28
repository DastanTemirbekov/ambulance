import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.icon, required this.title})
      : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Image.asset(
            'assets/images/$icon',
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(title, style: AmbulanceTextStyle.sfW400S15),
          ),
        ],
      );
}
