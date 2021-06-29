import 'dart:ui';

import 'package:explow/components/SearchField.dart';
import 'package:explow/constants/constants.dart';
import 'package:explow/screens/Drawer/Drawer.dart';
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
                      fontSize: isPhone(context) ? 100 : 200,
                      color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  "Your Favorite Media Explorer",
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: kSubTitleStyle,
                ),
                Spacer(),
                SearchField(mycontroller: mycontroller),
                Spacer(),
                Text(
                  "OR",
                  style: kSubTitleStyle,
                ),
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () => Get.toNamed("/news/"),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("Get Entertainment News",
                        style: kSubTitleStyle.copyWith(
                            color: Colors.black, fontSize: 25)),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ));
  }
}
