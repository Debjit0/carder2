import 'package:carder2/addCard.dart';
import 'package:carder2/deletecard.dart';
import 'package:carder2/models/DatabaseHelper.dart';
import 'package:carder2/models/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'models/fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: AddCard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool bs = false;
  DatabaseHelper _dbhelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //CardWidget(),
              FutureBuilder(
                future: _dbhelper.getCards(),
                builder: (context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CardWidget(
                        cardHolder: snapshot.data[index].cardHolder,
                        bankNm: snapshot.data[index].bankNm,
                        cardNo: snapshot.data[index].cardNo,
                        exp: snapshot.data[index].exp,
                        type: snapshot.data[index].type,
                        cvv: snapshot.data[index].cvv,
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ExpandableFabClass(
        distanceBetween: 70.0,
        subChildren: [
          FloatingActionButton.extended(
            backgroundColor: Colors.black,
            heroTag: "btn1",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddCard()));
            },
            label: Text(
              "Add Card",
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.credit_card_outlined),
            foregroundColor: Colors.white,
          ),
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            heroTag: "btn2",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DeleteCard()));
            },
            label: Text("Delete Card"),
            icon: Icon(Icons.credit_card_off_outlined),
          ),
        ],
      ),
    );
  }
}
