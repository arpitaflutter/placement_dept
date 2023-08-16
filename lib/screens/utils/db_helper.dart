import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:placement_dept/screens/home/model/home_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Database? database;

  Future checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    print("---------------------print---------------");
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "sql_database.db");
    return openDatabase(path, onCreate: (db, version) {
      String Query =
          "CREATE TABLE database_table (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, price TEXT,qa TEXT,desc TEXT, image TEXT,cate TEXT)";
      db.execute(Query);
    }, version: 1);
  }

  Future<void> insertDB(
      {required name,
      required price,
      required qa,
      required cate,
      required desc,
      required image}) async {
    database = await checkDB();

    database!.insert("database_table", {
      "name": name,
      "price": price,
      "cate": cate,
      "desc": desc,
      "image": image,
      "qa": qa
    });
  }

  Future<List<Map>> readDB() async {
    database = await checkDB();
    String Query = "SELECT * FROM database_table";

    List<Map> DataList = await database!.rawQuery(Query);
    return DataList;
  }

  void deleteDB({required id}) {
    database!.delete("database_table", where: "id = ?", whereArgs: [id]);
  }

  Future<void> updateDB(
      {required id,
      required name,
      required price,
      required qa,
      required cate,
      required desc,
      required image}) async {
    database = await checkDB();
    database!.update(
        "database_table",
        {
          "id": id,
          "name": name,
          "price": price,
          "cate": cate,
          "desc": desc,
          "image": image,
          "qa": qa
        },
        whereArgs: [id],
        where: "id = ?");
  }

  void update(HomeModel h1) {}
}
