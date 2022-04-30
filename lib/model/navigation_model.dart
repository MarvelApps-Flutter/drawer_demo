import 'package:flutter/material.dart';

class NavigationModel {
  String? title;
  IconData? icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Home", icon: Icons.home),
  NavigationModel(title: "Transactions", icon: Icons.filter_list_outlined),
  NavigationModel(title: "Card Details", icon: Icons.credit_card)
];