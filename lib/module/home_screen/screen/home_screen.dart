import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_app/core/constant/common_images.dart';
import 'package:demo_app/core/constant/common_string.dart';
import 'package:demo_app/core/database/sqflite_database.dart';
import 'package:demo_app/module/widget/common_divider.dart';
import 'package:demo_app/module/widget/common_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/api/get_users_detils.dart';
import '../../../core/constant/common_colors.dart';
import '../../../core/constant/common_icons.dart';
import '../../../core/getx/getx_handler.dart';
import '../../favorite_screen/favorite_screen.dart';
import '../../widget/common_user_card.dart';
import '../../widget/common_data_connectivity_dialog_bot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    internetChecking(context);
    ApiCalls().refreshData(context);
    GetXDataHandler.foundUser = GetXDataHandler.userList;
  }

  internetChecking(context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      DataConnectivityCheck.showDialogBox(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Obx(
          () => GetXDataHandler.isSearching.value
              ? Container(
                  decoration: BoxDecoration(
                    color: CommonColors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: CommonString.search,
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        GetXDataHandler.searchUser(value);
                      });
                    },
                  ),
                )
              : Text(CommonString.homePageAppBarrTitle),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  if (GetXDataHandler.isSearching.value == false) {
                    GetXDataHandler.isSearching.value = true;
                  } else {
                    GetXDataHandler.isSearching.value = false;
                  }
                },
                icon: GetXDataHandler.isSearching.value
                    ? CommonIcons.cancel
                    : CommonIcons.search),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: CommonColors.black45,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage(CommonImages.userImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      CommonString.userName,
                      style: TextStyle(color: CommonColors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CommonDivider(
                  left: 10,
                  right: 10,
                  thickness: 0.5,
                  color: CommonColors.white,
                ),
                CommonListTile(
                  onTap: () => Get.back(),
                  icon: const Icon(Icons.home),
                  iconColor: CommonColors.white,
                  title: CommonString.home,
                  style: TextStyle(fontSize: 25, color: CommonColors.white),
                ),
                CommonDivider(
                  left: 70,
                  right: 10,
                  thickness: 0.5,
                  color: CommonColors.white,
                ),
                CommonListTile(
                  onTap: () => Get.to(() => const FavoriteUserScreen()),
                  icon: CommonIcons.favorite,
                  iconColor: CommonColors.red,
                  title: CommonString.favorite,
                  style: TextStyle(
                    fontSize: 23,
                    color: CommonColors.yellow,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 430),
                  child: TextButton(
                    onPressed: () async {
                      await SqfLiteDatabase.deleteAllUsers();
                      GetXDataHandler.userList.clear();
                      GetXDataHandler.favoriteList.clear();
                      Get.back();
                    },
                    child: Text(
                      CommonString.clearButton,
                      style: TextStyle(color: CommonColors.red),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (GetXDataHandler.foundUser.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      CommonString.noUserFoundHomePage,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                return;
              },
              child: ListView.builder(
                itemCount: GetXDataHandler.foundUser.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    index: index,
                    user: GetXDataHandler.foundUser,
                    isFavoriteScreen: false,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
