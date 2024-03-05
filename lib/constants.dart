import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bool MALE = true;
const bool FEMALE = false;
const kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w900,
  letterSpacing: 1,
);

const kActiveTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  letterSpacing: 2,
  color: kButtonColor,
);

const kLabelTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 40,
);

const kResultTextStyle = TextStyle(
  color: kButtonColor,
  fontWeight: FontWeight.w900,
  fontSize: 40,
);

const kResultLabelTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 25 ,
);

const kResultSmallTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 20,
);

const kPrimaryColor = Color.fromARGB(255, 255, 255, 255);

const kBackgroundColor = Color.fromARGB(255, 255, 255, 255);

const kButtonColor = Color(0xFF0861E7);

const kAddIcon = Icons.add;

const kMinusIcon = FontAwesomeIcons.minus;

const kBoxShadow = [
  BoxShadow(
    color: Color(0xFFD9D8D8),
    blurRadius: 4,
    spreadRadius: 1,
    offset: Offset(2, 2),
  )
];
