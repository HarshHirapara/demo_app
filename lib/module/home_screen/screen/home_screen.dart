import 'dart:developer';

import 'package:demo_app/core/api/get_users_detils.dart';
import 'package:demo_app/core/constant/common_colors_file.dart';
import 'package:demo_app/core/constant/common_icons_file.dart';
import 'package:demo_app/core/database/getx_functions.dart';
import 'package:demo_app/core/database/sqflite_database.dart';
import 'package:demo_app/core/model/user_model_class.dart';
import 'package:demo_app/module/favorite_screen/favorite_screen.dart';
import 'package:demo_app/module/widget/common_widget_user_card.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> usersData = [];
  refreshData() async {
    ApiCalls.getUserApi();
    usersData = await SqfLiteDatabase.getData();
    for (var element in usersData) {
      GetXFunctions.userList.add(element);
    }
    log(usersData.toString());
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 0.7,
                color: CommonColors.white,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavoriteUserScreen(),
                ));
              },
              leading: SizedBox(
                child: CommonIcons.favorite,
              ),
              iconColor: CommonColors.red,
              title: Text(
                'Favorite',
                style: TextStyle(fontSize: 23, color: CommonColors.yellow),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Clear Data'),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: GetXFunctions.userList.length,
            itemBuilder: (context, index) {
              // final user = userList[index];
              // log(userList[index].toString());
              return UserCard(
                  index: index, user: GetXFunctions.userList[index]);
            }),
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