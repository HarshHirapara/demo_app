import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_app/core/api/get_users_detils.dart';
import 'package:demo_app/core/constant/common_string.dart';
import 'package:demo_app/module/widget/common_no_internet_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/common_icons.dart';
import '../../core/getx/getx_handler.dart';
import '../../core/database/sqflite_database.dart';

class DataConnectivityCheck {
  static showDialogBox(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  CommonString.noInternetFound,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  CommonString.onMobileDataOrWiFiData,
                  style: const TextStyle(
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
                        GetXDataHandler.userList.addAll(usersDataFormDatabase);
                        GetXDataHandler.userList.refresh();
                        if (GetXDataHandler.userList.isEmpty) {
                          CommonNoNetworkSnackbar(
                            CommonString.allDataClearOnNetwork,
                          );
                        } else {
                          Get.back();
                          Get.back();
                        }
                      },
                      child: Text(CommonString.cancel),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        var checkNetwork =
                            await (Connectivity().checkConnectivity());
                        if (checkNetwork == ConnectivityResult.none) {
                          CommonNoNetworkSnackbar(
                            CommonString.pleaseTurnonMoBileData,
                          );
                        } else {
                          ApiCalls().refreshData(context);
                          Get.back();
                          Get.back();
                        }
                      },
                      child: Text(CommonString.ok),
                    ),
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