import 'package:carder2/models/CardInfo.dart';
import 'package:carder2/models/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

class AddCard extends StatefulWidget {
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  var _dropDownValue;
  TextEditingController cno = new TextEditingController();
  TextEditingController bnm = new TextEditingController();
  TextEditingController exp = new TextEditingController();
  TextEditingController chn = new TextEditingController();
  TextEditingController cvv = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Card",
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Card Number"),
                controller: cno,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Bank Name"),
                controller: bnm,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Expiry (Ex 10/25)"),
                controller: exp,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Card holder's name"),
                controller: chn,
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "CVV"),
                controller: cvv,
              ),
            ),
            DropdownButton(
              hint: _dropDownValue == null
                  ? Text('Card Type')
                  : Text(
                      _dropDownValue,
                      style: TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.blue),
              items: [
                'none',
                'RuPay',
                'Visa',
                'Master',
                'Mastro',
                'American Express',
                'Diners Club',
                'elo',
                'jcb'
              ].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    _dropDownValue = val;
                  },
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(_dropDownValue);
                  print(cno.text);
                  print(bnm.text);
                  print(exp.text);
                  print(chn.text);
                  print(cvv.text);
                },
                child: Text("Print(Just For Debug Purposes)")),
            ElevatedButton(
                onPressed: () {
                  print("database created");
                  DatabaseHelper _dbHelper = DatabaseHelper();
                  CardInfo _newCardInfo = CardInfo(
                      exp: exp.text,
                      cvv: cvv.text,
                      bankNm: bnm.text,
                      cardNo: cno.text,
                      cardHolder: chn.text,
                      type: _dropDownValue);
                  _dbHelper.insertCards(_newCardInfo);
                  print("database created");
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
