import 'package:get/get.dart';

class GetXDataHandler extends GetxController {
  static RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  static RxList<Map<String, dynamic>> foundUser = <Map<String, dynamic>>[].obs;
  static RxList<Map<String, dynamic>> favoriteList =
      <Map<String, dynamic>>[].obs;

  static Rx<bool> isSearching = false.obs;

  static searchUser(value) {
    RxList<Map<String, dynamic>> result = <Map<String, dynamic>>[].obs;
    if (value.isEmpty) {
      result = GetXDataHandler.userList;
    } else {
      for (var i = 0; i < GetXDataHandler.userList.length; i++) {
        final int id = GetXDataHandler.userList[i]['id'];
        final String firstName = GetXDataHandler.userList[i]['firstName'];
        final String lastName = GetXDataHandler.userList[i]['lastName'];
        final String email = GetXDataHandler.userList[i]['email'];

        final String firstNameToLowerCase = lastName.toLowerCase();
        final String lastNameToLowerCase = firstName.toLowerCase();
        final String emailToLowerCase = email.toLowerCase();
        final String fullName =
            '${firstName.toLowerCase()} ${lastName.toLowerCase()}';
        if (value == id.toString() ||
            value == firstNameToLowerCase ||
            value == lastNameToLowerCase ||
            value == emailToLowerCase ||
            value == fullName) {
          result.add(GetXDataHandler.userList[i]);
        }
      }
    }
    GetXDataHandler.foundUser = result;
  }
}
