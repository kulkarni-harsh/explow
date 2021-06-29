import 'dart:ui';

import 'package:explow/components/SearchField.dart';
import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/showcontroller.dart';
import 'package:explow/screens/Drawer/Drawer.dart';
import 'package:explow/screens/SearchPage/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  TextEditingController mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            kPrimaryColorDark,
            kPrimaryColor,
            kPrimaryColor.withOpacity(0.999)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
              children: [
                Text(
                  "EXPLOW",
                  style: kTitleStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height >
                              MediaQuery.of(context).size.width
                          ? 150
                          : 200,
                      color: Colors.white),
                ),
                SearchField(mycontroller: mycontroller)
              ],
            ),
          ),
        ));
  }
}
