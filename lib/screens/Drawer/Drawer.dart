import 'package:explow/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: GestureDetector(
              onTap: () => Get.toNamed('/'),
              child: Text(
                "EXPLOW",
                style: kTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Search"),
            onTap: () => Get.toNamed("/searchpage/RickAstley"),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("POPUP"),
            onTap: () => Get.toNamed("/info/tt4052886"),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Entertainment News"),
            onTap: () => Get.toNamed("/news/"),
          ),
        ],
      ),
    );
  }
}
