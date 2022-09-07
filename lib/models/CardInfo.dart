import 'package:flutter/material.dart';

class CardInfo {
  late var id;
  late var cardNo;
  late var bankNm;
  late var exp;
  late var cardHolder;
  late var cvv;
  late var type;

  CardInfo(
      {this.cvv,
      this.bankNm,
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
}
