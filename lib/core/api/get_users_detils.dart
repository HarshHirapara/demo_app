import 'dart:developer';

import 'package:demo_app/core/database/getx_functions.dart';
import 'package:demo_app/core/database/sqflite_database.dart';
import 'package:dio/dio.dart';

import '../model/user_model_class.dart';

class ApiCalls {
  static List<UserModel> usersData = [];
  static Future getUserApi() async {
    Response response = await Dio().get('https://jsonplaceholder.org/users');
    List apiData = response.data;
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in apiData) {
        // GetXFunctions.userList.add(
        //   UserModel.fromJson(index),
        // );
        usersData.add(UserModel.fromJson(index));
      }
      for (UserModel index in usersData) {
        // final address = {
        //   '${index.address.street} ${index.address.suite} ${index.address.city} ${index.address.zipCode}'
        // };
        // final company = {
        //   '${index.company.name} ${index.company.catchPhrase} ${index.company.bs}'
        // };
        SqfLiteDatabase.insertData(
          int.parse('${index.id}'),
          index.firstName,
          index.lastName,
          index.email,
          '${index.birthDate}',
          // address,
          // '${index.phone}',
          index.website,
          // company,
        );
      }
    }
  }
}
