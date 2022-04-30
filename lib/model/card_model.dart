import 'package:flutter/material.dart';

class CardModel {
  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  Color? cardColor;

  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cvv,
    this.expDate,
    this.cardColor,
  });
}

List<CardModel> cardsList = [
  CardModel(
    cardHolderName: "User",
    cardNumber: "****  ****  ****  1234",
    cvv: "**6",
    expDate: "11/26",
    cardColor: Colors.white,
  ),
  CardModel(
    cardHolderName: "User",
    cardNumber: "****  ****  ****  4321",
    cvv: "**8",
    expDate: "06/27",
    cardColor: Colors.white,
  ),
];