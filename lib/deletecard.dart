import 'package:carder2/main.dart';
import 'package:carder2/models/CardInfo.dart';
import 'package:carder2/models/DatabaseHelper.dart';
import 'package:carder2/models/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

class DeleteCard extends StatefulWidget {
  @override
  State<DeleteCard> createState() => _DeleteCardState();
}

class _DeleteCardState extends State<DeleteCard> {
  var _dropDownValue;
  TextEditingController cno = new TextEditingController();
  TextEditingController bnm = new TextEditingController();
  TextEditingController exp = new TextEditingController();
  TextEditingController chn = new TextEditingController();
  TextEditingController cvv = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(child: Text("Not Yet Created")),
        ),
      ),
    );
  }
}
