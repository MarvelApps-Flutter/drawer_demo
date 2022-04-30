import 'package:flutter/material.dart';

class ListModel
{
  final Color? colors;
  final Icon? icons;
  final String? text;

  ListModel({this.colors, this.icons, this.text});

}

List<ListModel> list = [
  ListModel(
      colors: Colors.white,
      icons: Icon(
        Icons.send,
        color: Colors.white,
      ),
      text: "Send"),
  ListModel(
      colors: Colors.white,
      icons: Icon(
        Icons.download,
        color: Colors.white,
      ),
      text: "Request"),
  ListModel(
      colors: Colors.white,
      icons: Icon(
        Icons.widgets,
        color: Colors.white,
      ),
      text: "More"),
];
