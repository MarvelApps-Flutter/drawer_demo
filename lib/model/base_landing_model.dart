import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';

class BaseLandingListModel
{
  final Color? colors;
  final String? text;

  BaseLandingListModel({this.colors, this.text});

}

List<BaseLandingListModel> baseLandingList = [
  BaseLandingListModel(
      colors: createMaterialColor(Color(0xFF161d3a)),
      text: "Simple Drawer"),
  BaseLandingListModel(
      colors: createMaterialColor(Color(0xFF161d3a)),
      text: "Multilevel Drawer"),
  BaseLandingListModel(
      colors: createMaterialColor(Color(0xFF161d3a)),
      text: "Hidden Drawer"),
  BaseLandingListModel(
      colors: createMaterialColor(Color(0xFF161d3a)),
      text: "Collapsible Drawer"),
];
