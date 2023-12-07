import 'dart:developer';
import 'package:demo_app/core/getx/getx_handler.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqfLiteDatabase {
  Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
      id INTEGER PRIMARY KEY,
      firstName TEXT,
      lastName TEXT,
      email TEXT,
      birthDate TEXT,
      address TEXT,
      phone INTEGER,
      website TEXT,
      company TEXT
    )""");
  }

  Future<sql.Database> db() async {
    return sql.openDatabase(
      'UserDatabase2.db',
      version: 1,
      onCreate: (sql.Database database, version) async {
        await createTable(database);
      },
    );
  }

  static Future insertData(
    int id,
    String firstName,
    String lastName,
    String email,
    String birthDate,
    String address,
    String phone,
    String website,
    String company,
  ) async {
    final db = await SqfLiteDatabase().db();
    final data = {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthDate': birthDate,
      'address': address,
      'phone': phone,
      'website': website,
      'company': company,
    };
    final user = await db.insert(
      'users',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return user;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await SqfLiteDatabase().db();
    final data = await db.query('users', orderBy: 'id');
    return data;
  }

  static Future<void> deleteAllUsers() async {
    final db = await SqfLiteDatabase().db();
    try {
      for (var element in GetXDataHandler.userList) {
        final int id = element['id'];
        log(id.toString());
        await db.delete(
          'users',
          where: 'id=?',
          whereArgs: [id],
        );
      }
    } catch (err) {
      log("Something wants wrong : $err");
    }
  }
}
