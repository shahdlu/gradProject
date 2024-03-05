import 'package:flutter/material.dart';
import '../constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.buttonbackcolor,
    required this.buttontextcolor,
  });

  final String title;
  final VoidCallback onTap;
  final Color buttonbackcolor;
  final  Color buttontextcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: buttonbackcolor,//kButtonColor,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 20,
                color: buttontextcolor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
