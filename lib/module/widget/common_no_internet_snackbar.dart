import 'package:demo_app/core/constant/common_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/common_colors.dart';

class CommonNoNetworkSnackbar {
  CommonNoNetworkSnackbar(msg) {
    String message = msg;
    Get.snackbar(
      icon: Icon(
        Icons.signal_wifi_connected_no_internet_4_rounded,
        color: CommonColors.red,
      ),
      CommonString.noInternetFound,
      message.toString(),
      backgroundColor: CommonColors.white,
      borderWidth: 3,
      borderColor: CommonColors.black,
    );
  }
}
