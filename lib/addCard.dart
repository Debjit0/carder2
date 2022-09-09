import 'package:carder2/main.dart';
import 'package:carder2/models/CardInfo.dart';
import 'package:carder2/models/DatabaseHelper.dart';
import 'package:carder2/models/cardwidget.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                child: Image.asset(
                  "assets/images/1.png",
                ),
              ),
              /*Text(
                "Add Card",
                style: TextStyle(
                  fontSize: 60,
                ),
              ),*/
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Card Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: cno,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Bank Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: bnm,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Expiry (Ex 10/25)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: exp,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Card holder's name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: chn,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "CVV",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: cvv,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.redAccent,
                      Colors.blueAccent,
                      Colors.purpleAccent
                      //add more colors
                    ]),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: DropdownButton(
                  hint: _dropDownValue == null
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Card Type',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Text(
                          _dropDownValue,
                          style: TextStyle(color: Colors.blue),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  dropdownColor: Color.fromARGB(245, 72, 73, 75),
                  iconEnabledColor: Colors.white,
                  items: [
                    'none',
                    'RuPay',
                    'Visa',
                    'Master',
                    'Maestro',
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
              ),
              /*ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () {
                    print(_dropDownValue);
                    print(cno.text);
                    print(bnm.text);
                    print(exp.text);
                    print(chn.text);
                    print(cvv.text);
                  },
                  child: Text("Print(Just For Debug Purposes)")),*/
              SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () {
                    print("database created");
                    DatabaseHelper _dbHelper = DatabaseHelper();
                    CardWidget _newCardWidget = CardWidget(
                        exp: exp.text,
                        cvv: cvv.text,
                        bankNm: bnm.text,
                        cardNo: cno.text,
                        cardHolder: chn.text,
                        type: _dropDownValue);
                    _dbHelper.insertCards(_newCardWidget);
                    print("database created");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: "Carder2",
                              )),
                    );
                  },
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
