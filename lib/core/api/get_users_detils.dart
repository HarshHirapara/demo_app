import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_app/core/database/sqflite_database.dart';
import 'package:dio/dio.dart';

import '../../module/widget/data_connectivity_dialog_bot.dart';
import '../getx/getx_functions.dart';
import '../model/user_model_class.dart';

class ApiCalls {
  List<Map<String, dynamic>> usersDataFormDatabase = [];
  static List<UserModel> usersData = [];
  static Future getUserApi() async {
    Response response = await Dio().get('https://jsonplaceholder.org/users');
    List apiData = response.data;
    log(response.data.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in apiData) {
        usersData.add(UserModel.fromJson(index));
      }
      for (UserModel index in usersData) {
        final String street = index.address.street.toString();
        final String suite = index.address.suite.toString();
        final String city = index.address.city.toString();
        final String zipCode = index.address.zipCode.toString();

        final String address =
            '$street${suite.substring(0, 3)} ${suite.substring(5)} ${city.substring(5)} ${zipCode.substring(0, 7)} ${zipCode.substring(12)}';

        final String name = index.company.name.toString();
        final String catchPhrase = index.company.catchPhrase.toString();
        final String bs = index.company.bs.toString();

        final String company = '$name $catchPhrase $bs';

        SqfLiteDatabase.insertData(
          int.parse('${index.id}'),
          index.firstName,
          index.lastName,
          index.email,
          '${index.birthDate}',
          address,
          '${index.phone}',
          index.website,
          company,
        );
      }
    }
  }

  refreshData(context) async {
    log('Refresh Data');
    var networkIsOn = await Connectivity().checkConnectivity();
    if (networkIsOn != ConnectivityResult.none) {
      ApiCalls.getUserApi();
      usersDataFormDatabase = await SqfLiteDatabase.getData();
      GetXFunctions.userList.addAll(usersDataFormDatabase);
    } else {
      DataConnectivityCheck.showDialogBox(context);
    }
  }
}