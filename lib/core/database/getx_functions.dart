import 'package:demo_app/core/model/user_model_class.dart';
import 'package:get/get_rx/get_rx.dart';

class GetXFunctions {
  static RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  static RxList<UserModel> favoriteList = <UserModel>[].obs;
}
