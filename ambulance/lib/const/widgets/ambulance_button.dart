import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:flutter/material.dart';

import '../ambulance_colors.dart';

class AmbulanceButton extends StatelessWidget {
  const AmbulanceButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 39.5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AmbulanceColors.buttonColor),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AmbulanceTextStyle.sfW600S18,
          ),
        ),
      ),
    );
  }
}
