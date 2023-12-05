import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_app/core/api/get_users_detils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/common_colors_file.dart';
import '../../core/constant/common_icons_file.dart';
import '../../core/getx/getx_functions.dart';
import '../../core/database/sqflite_database.dart';

class DataConnectivityCheck {
  static showDialogBox(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonIcons.noNetwork,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'No Internet',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Please Turn on Mobile Data or WiFi',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        List<Map<String, dynamic>> usersDataFormDatabase = [];
                        usersDataFormDatabase = await SqfLiteDatabase.getData();
                        GetXFunctions.userList.addAll(usersDataFormDatabase);
                        Get.back();
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () async {
                          var checkNetwork =
                              await (Connectivity().checkConnectivity());
                          if (checkNetwork == ConnectivityResult.none) {
                            Get.snackbar(
                              icon: Icon(
                                Icons
                                    .signal_wifi_connected_no_internet_4_rounded,
                                color: CommonColors.red,
                              ),
                              'Internet Not Found',
                              'Please turn on your mobile data or wifi',
                              backgroundColor: CommonColors.white,
                              borderWidth: 3,
                              borderColor: CommonColors.black,
                            );
                          } else {
                            ApiCalls().refreshData(context);
                            Get.back();
                            Get.back();
                          }
                        },
                        child: const Text('ok')),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
