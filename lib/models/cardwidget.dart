import 'dart:math';

import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  int? id;
  String? cardNo;
  String bankNm;
  String? exp;
  String? cardHolder;
  String? cvv;
  String? type;

  CardWidget(
      {this.cvv,
      required this.bankNm,
      this.cardHolder,
      this.cardNo,
      this.exp,
      this.id,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardNo': cardNo,
      'bankNm': bankNm,
      'exp': exp,
      'cardHolder': cardHolder,
      'cvv': cvv,
      'type': type,
    };
  }

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool bs = false;
  CardType typeCheck(String type2) {
    if (type2 == "Mastro")
      return CardType.maestro;
    else if (type2 == "RuPay")
      return CardType.rupay;
    else if (type2 == "Visa")
      return CardType.visa;
    else if (type2 == "Master")
      return CardType.masterCard;
    else if (type2 == "American Express")
      return CardType.americanExpress;
    else if (type2 == "American Express")
      return CardType.americanExpress;
    else if (type2 == "Diners Club")
      return CardType.dinersClub;
    else if (type2 == "elo")
      return CardType.elo;
    else if (type2 == "jcb")
      return CardType.jcb;
    else
      return CardType.other;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CreditCard(
            cardNumber: widget.cardNo,
            cardExpiry: widget.exp,
            cardHolderName: widget.cardHolder,
            cvv: widget.cvv,
            bankName: widget.bankNm,
            cardType: typeCheck(widget.type.toString()),
            showBackSide: bs,
            frontBackground: CardBackgrounds.black,
            backBackground: CardBackgrounds.white,
            showShadow: true,
          ),
          Container(
            height: 200,
            width: 400,
            //decoration: BoxDecoration(color: Colors.red),
            child: InkWell(
              onTap: () {
                if (bs == true) {
                  setState(() {
                    bs == false;
                    print(bs);
                  });
                } else if (bs == false) {
                  setState(() {
                    bs == true;
                    print(bs);
                  });
                }
              },
            ),
          ),
          /*ElevatedButton(
              onPressed: () {
                //print(cardNo);
                //print(cardHolder);
                print(cvv);
              },
              child: Text("card no")),*/
        ],
      ),
    );
  }
}
