class TransactionModel
{
  final String? name;
  final String? time;
  final String? amount;
  final String? icon;

  TransactionModel({this.name, this.time, this.amount, this.icon});

}

List<TransactionModel> transactionList = [
  TransactionModel(
      icon: "assets/images/user_profile1.png",
      name: "Anna",
      amount: "Rs.67",
      time: "22:10"),
  TransactionModel(
      icon: "assets/images/user_profile2.png",
      name: "Alex",
      amount: "Rs.89",
      time: "17:10"),
  TransactionModel(
      icon: "assets/images/user_profile3.png",
      name: "Devid",
      amount: "Rs.110",
      time: "08:09"),
  TransactionModel(
      icon: "assets/images/user_profile4.png",
      name: "Kenne",
      amount: "Rs.99",
      time: "21:10"),
  TransactionModel(
      icon: "assets/images/user_profile5.png",
      name: "Lana",
      amount: "Rs.88",
      time: "19:20"),
];
