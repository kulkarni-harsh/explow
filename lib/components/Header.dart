import 'dart:math';

import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/showcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.showController,
  }) : super(key: key);

  final ShowController showController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 45,
              ),
              onPressed: showController.openDrawer,
            ),
            Spacer(),
            GestureDetector(
              child: Text(
                "EXPLOW",
                style: kTitleStyle,
              ),
              onTap: () => Get.toNamed('/'),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 45,
              ),
              onPressed: () {
                int i = Random().nextInt(10);
                if (i.isEven)
                  _launchURL("https://github.com/kulkarni-harsh/explow");
                else
                  _launchURL("https://youtu.be/dQw4w9WgXcQ");
              },
            )
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Your Favorite Media Explorer",
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          style: kSubTitleStyle,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
