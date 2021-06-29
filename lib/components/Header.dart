import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/showcontroller.dart';
import 'package:flutter/material.dart';

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
            Text(
              "EXPLOW",
              style: kTitleStyle,
            ),
            Spacer(),
            Icon(
              Icons.info_outline,
              size: 45,
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
