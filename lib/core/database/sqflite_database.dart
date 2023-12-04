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
      'UserDatabase1.db',
      version: 1,
      onCreate: (sql.Database database, version) async {
        await createTable(database);
      },
    );
  }

  // static Future insertData() async {
  //   log(usersData.toString());
  //   final db = await SqfLiteDatabase().db();
  //   for (UserModel index in usersData) {
  //     final address = {
  //       '${usersData[index].address.street} ${usersData[index].address.suite} ${usersData[index].address.city} ${usersData[index].address.zipCode}'
  //     };
  //     final company = {
  //       '${usersData[index].company.name} ${usersData[index].company.catchPhrase} ${usersData[index].company.bs}'
  //     };
  //     final data = {
  //       'id': int.parse('${usersData[index].id}'),
  //       'firstName': usersData[index].firstName,
  //       'lastName': usersData[index].lastName,
  //       'email': usersData[index].email,
  //       'birthDate': usersData[index].birthDate,
  //       'address': address,
  //       'phone': usersData[index].phone,
  //       'website': usersData[index].website,
  //       'company': company,
  //     };
  //     final user = await db.insert(
  //       'users',
  //       data,
  //       conflictAlgorithm: sql.ConflictAlgorithm.replace,
  //     );
  //     log(user.toString());
  //     return user;
  //   }
  // }

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
}
