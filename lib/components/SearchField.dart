import 'package:explow/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.mycontroller,
  }) : super(key: key);

  final TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
      style: TextStyle(
          color: kPrimaryColorDark, fontSize: 20, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          hintText: "Enter Title of Movie/ Series",
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            color: kPrimaryColorDark,
            onPressed: () {
              Get.toNamed(
                  "/searchpage/${mycontroller.text.replaceAll(' ', '')}");
              print("/searchpage/${mycontroller.text.replaceAll(' ', '')}");
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.blueGrey),
      onSubmitted: (s) {
        Get.toNamed("/searchpage/${mycontroller.text.replaceAll(' ', '')}");
        print("/searchpage/${mycontroller.text.replaceAll(' ', '')}");
      },
    );
  }
}
