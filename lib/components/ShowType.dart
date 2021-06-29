import 'package:flutter/material.dart';

Widget getType(String type) {
  if (type == "movie")
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(
                Icons.movie,
                size: 15,
              ),
            ),
          ),
          TextSpan(
              text: 'Movie',
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 12)),
        ],
      ),
    );
  if (type == "short")
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(
                Icons.movie,
                size: 15,
              ),
            ),
          ),
          TextSpan(
              text: 'Short',
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 12)),
        ],
      ),
    );
  return RichText(
    text: TextSpan(
      children: [
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(
              Icons.tv,
              size: 15,
            ),
          ),
        ),
        TextSpan(
            text: 'Series',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w400,
                fontSize: 12)),
      ],
    ),
  );
}
