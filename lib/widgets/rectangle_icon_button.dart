
import 'package:flutter/material.dart';

import '../constants.dart';

class RectangleIconButton extends StatelessWidget {
  const RectangleIconButton({super.key, required this.onPressed, required this.backcolor});
  //final IconData icon;
  final VoidCallback onPressed;
  final Color backcolor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //fillColor: kButtonColor,
      fillColor: backcolor,
      shape: CircleBorder(
        side: BorderSide(width: 1, color: backcolor),
      ),
      constraints: const BoxConstraints.tightFor(height: 130, width: 150),
      elevation: 10,
      onPressed: onPressed,
    );
  }
}
