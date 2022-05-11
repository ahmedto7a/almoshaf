import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QuranDB {
  static var database;

  ///بنقل الداتا ع الموبيل
  static Future<Database> initializeDatabase() async {
    ///عشان انقله في فولدر اسمه مصحف
    String database_path = await getDatabasesPath();
    String path = join(database_path, "mos7af.db");

    var exist = await databaseExists(path);
    if (!exist) {
      await copyDB(path);
    }
    database = openDatabase(path, readOnly: true);
  }

  static copyDB(path) async {
    ///load غشلت اقوله انه بايتس
    ///rootBundle عشان اقف عند البروجكت
    ByteData myData = await rootBundle.load(join("assets", "quran.db"));

    ///read file as bytes
    ///
    List<int> bytes =
        myData.buffer.asUint8List(myData.offsetInBytes, myData.lengthInBytes);

    ///convert from byteData to list of bytes
    await File(path).writeAsBytes(bytes);

    ///write bytes
    print("done");
  }

  static retrieve(table, where) async {
    var db = await database;
    List<Map> data = await db.query(table, where: where);

    return data;
  }
}
