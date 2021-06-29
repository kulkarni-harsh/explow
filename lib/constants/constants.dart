import 'package:flutter/material.dart';

Color kPrimaryColorDark = Color(0xFF211e42);
Color kPrimaryColor = Color(0xFF44406F);
TextStyle kTitleStyle =
    TextStyle(fontFamily: "AppTitle", fontSize: 60, letterSpacing: 4);
TextStyle kTitleStyleMini =
    TextStyle(fontFamily: "AppTitle", fontSize: 30, letterSpacing: 2);

TextStyle kSubTitleStyle = TextStyle(
  fontSize: 20,
  fontFamily: "Heading",
  color: Colors.white70,
);
TextStyle kSubTitleStyleMini = TextStyle(
  fontSize: 15,
  fontFamily: "Heading",
  color: Colors.white70,
);
BoxDecoration kShowCard = BoxDecoration(
    color: kPrimaryColor,
    border: Border.all(color: Colors.white, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(5)));

TextStyle kShowCardDetailsText =
    TextStyle(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 17);
TextStyle kShowCardDetailsTextMini =
    TextStyle(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 15);

TextStyle kInfoTitle = kSubTitleStyle.copyWith(
    fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle kInfoTitleMini = kSubTitleStyle.copyWith(
    fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle kInfoDetail =
    kSubTitleStyle.copyWith(fontSize: 20, color: Colors.black87);
TextStyle kInfoDetailMini =
    kSubTitleStyle.copyWith(fontSize: 15, color: Colors.black87);

bool isPhone(BuildContext context) {
  return MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
}
