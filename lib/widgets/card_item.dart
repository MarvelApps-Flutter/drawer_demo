import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/model/card_model.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';

class CardItem extends StatelessWidget {
  final CardModel? card;
  const CardItem({Key? key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: card!.cardColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CARD NAME",
                    style: AppTextStyles.regularForBigWhiteTextStyle,
                  ),
                  Text(
                    card!.cardHolderName!,
                    style: AppTextStyles.lightWhiteTextStyle,
                  ),
                ],
              ),
              Text(
                card!.cardNumber!,
                style: AppTextStyles.lightWhiteTextStyle,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EXP DATE",
                        style: AppTextStyles.boldBlackSmallTextStyle,
                      ),
                      Text(
                        card!.expDate!,
                        style: AppTextStyles.lightWhiteTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV NUMBER",
                        style: AppTextStyles.boldBlackSmallTextStyle,
                      ),
                      Text(
                        card!.cvv!,
                        style: AppTextStyles.lightWhiteTextStyle,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/cards.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}