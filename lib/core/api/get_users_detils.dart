import 'dart:developer';

import 'package:demo_app/core/database/getx_functions.dart';
import 'package:dio/dio.dart';

import '../model/user_model_class.dart';

class ApiCalls {
  static Future getUserApi() async {
    Response response = await Dio().get('https://jsonplaceholder.org/users');
    List apiData = response.data;
    // log(response.data.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in apiData) {
        GetXFunctions.userList.add(
          UserModel.fromJson(index),
        );
        log(index.toString());
      }
    }
    // log(GetXFunctions.userList.length.toString());
  }
}
