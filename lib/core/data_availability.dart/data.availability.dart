// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import '../../module/widget/data_connectivity_dialof_bot.dart';

// class DataConnectivity {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   RxBool isAlertSet = false.obs;

//   getConnectivity() {
//     return subscription = Connectivity().onConnectivityChanged.listen(
//       (ConnectivityResult result) async {
//         isDeviceConnected = await InternetConnectionChecker().hasConnection;
//         if (!isDeviceConnected && isAlertSet == false) {
//           const DataConnectivityDialogBox();
//         }
//       },
//     );
//   }
// }
