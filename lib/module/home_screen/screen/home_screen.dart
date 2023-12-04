import 'dart:developer';

import 'package:demo_app/core/api/get_users_detils.dart';
import 'package:demo_app/core/constant/common_colors_file.dart';
import 'package:demo_app/core/constant/common_icons_file.dart';
import 'package:demo_app/core/database/getx_functions.dart';
import 'package:demo_app/core/database/sqflite_database.dart';
import 'package:demo_app/module/favorite_screen/favorite_screen.dart';
import 'package:demo_app/module/widget/common_user_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> usersData = [];
  List<Map<String, dynamic>> foundData = [];
  refreshData() async {
    ApiCalls.getUserApi();
    //  GetXFunctions.userList = await SqfLiteDatabase.getData();
    usersData = await SqfLiteDatabase.getData();
    GetXFunctions.userList.addAll(usersData);
    // log(usersData.toString());
  }

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  Icon searchIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('Home Page');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: appBarTitle,
        actions: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  if (searchIcon.icon == const Icon(Icons.search).icon) {
                    searchIcon = const Icon(Icons.cancel);
                    appBarTitle = Container(
                      decoration: BoxDecoration(
                        color: CommonColors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          filled: true,
                        ),
                        onChanged: (value) {},
                      ),
                    );
                  } else {
                    searchIcon = const Icon(Icons.search);
                    appBarTitle = const Text('Home Page');
                  }
                },
              );
            },
            icon: searchIcon,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black45,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1701273973387-8abff988bb88?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Harsh Hirapara',
                      style: TextStyle(color: CommonColors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    thickness: 0.7,
                    color: CommonColors.white,
                  ),
                ),
                ListTile(
                  onTap: () => Get.back(),
                  leading: Icon(
                    Icons.home,
                    color: CommonColors.white,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 25, color: CommonColors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 10),
                  child: Divider(
                    thickness: 0.3,
                    color: CommonColors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const FavoriteUserScreen());
                  },
                  leading: SizedBox(
                    child: CommonIcons.favorite,
                  ),
                  iconColor: CommonColors.deepPurple,
                  title: Text(
                    'Favorite',
                    style: TextStyle(fontSize: 23, color: CommonColors.yellow),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 430),
                  child: TextButton(
                    onPressed: () {
                      GetXFunctions.userList.clear();
                      GetXFunctions.favoriteList.clear();
                      Get.back();
                    },
                    child: Text(
                      'Clear Data',
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
          if (GetXFunctions.userList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'No DataFound',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: GetXFunctions.userList.length,
              itemBuilder: (context, index) {
                // final user = userList[index];
                // log(userList[index].toString());
                return UserCard(index: index, user: GetXFunctions.userList);
              },
            );
          }
        },
      ),
    );
  }
}

// List<Map<String, dynamic>> myData = [];
// bool isLoading = true;

// void refreshData() async {
//   final data = await DatabaseHandler.getItems();
//   setState(() {
//     myData = data;
//     isLoading = false;
//   });
// }

// @override
// void initState() {
//   super.initState();
//   refreshData();
// }

// List allUsers = [
//   'phone',
//   'app',
//   'mango',
//   'harsh',
//   'school',
//   'hello',
//   'hey',
//   'Cricket'
// ];
// List foundUser = [];

// @override
// void initState() {
//   foundUser = allUsers;
//   super.initState();
// }

// void filter(value) {
//   List results = [];
//   if (value.isEmpty) {
//     results = allUsers;
//   } else {
//     results = allUsers.where((element) => element.contains(value)).toList();
//   }

//   setState(() {
//     foundUser = results;
//   });
// }

  //  var mappedList = boards.boards!.take(5).toList(); 


  //  // now, from the list above, I map each result into a key-value pair

  //   var mappedValues = mappedList.map((m) => { 'headsign': m.getString('headsign'), 'time': m.getString('time') });

  //  // this list will look like:
  //  // [{ headsign: 'value1', title: 'title1'}, { headsign: 'value2', title: 'value2' }]


  //  // Now moving mappedValues list to showDialog
  //  String title = ("Title Test");

  //  _DropDownList(mappedValues, title);
  //  });
  // }


  // Future<void> _DropDownList(List<Map<String, dynamic>> values, String title) async {
  //        var test1 = ListBody(
  //             ...