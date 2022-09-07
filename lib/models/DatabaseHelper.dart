import 'package:carder2/models/CardInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'carder.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE cards(id INTEGER PRIMARY KEY, cardNo TEXT, bankNm TEXT,cardHolder TEXT, exp TEXT, cvv TEXT, type TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertCards(CardInfo cardinfo) async {
    Database _db = await database();
    await _db.insert('cards', cardinfo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CardInfo>> getCards() async {
    Database _db = await database();
    List<Map<String, dynamic>> cardMap = await _db.query('cards');
    return List.generate(cardMap.length, ((index) {
      return CardInfo(
          id: cardMap[index]['id'],
          cardHolder: cardMap[index]['cardHolder'],
          cardNo: cardMap[index]['cardNo'],
          cvv: cardMap[index]['cvv'],
          exp: cardMap[index]['cardHolder'],
          type: cardMap[index]['cardHolder'],
          bankNm: cardMap[index]['bankNm']);
    }));
  }
}
