import 'package:carder2/addCard.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CreditCard(
                    cardNumber: "5450 7879 4864 7854",
                    cardExpiry: "10/25",
                    cardHolderName: "Card Holder",
                    cvv: "456",
                    bankName: "Axis Bank",
                    cardType: CardType.visa,
                    showBackSide: bs,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: 'Exp. Date',
                    textName: 'Name',
                    textExpiry: 'MM/YY'),
                Container(
                  height: 200,
                  width: 400,
                  //decoration: BoxDecoration(color: Colors.red),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (bs == true) {
                          bs = false;
                        } else {
                          bs = true;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ExpandableFabClass(
        distanceBetween: 70.0,
        subChildren: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddCard()));
            },
            label: Text("Add Card"),
            icon: Icon(Icons.credit_card_outlined),
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () => print('ABC'),
            label: Text("Delete Card"),
            icon: Icon(Icons.credit_card_off_outlined),
          ),
        ],
      ),
    );
  }
}
