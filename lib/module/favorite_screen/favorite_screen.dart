import 'package:demo_app/core/constant/common_string.dart';
import 'package:demo_app/core/getx/getx_handler.dart';
import 'package:demo_app/module/widget/common_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FavoriteUserScreen extends StatelessWidget {
  const FavoriteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CommonString.favoritePageAppBarTitle),
      ),
      body: Obx(
        () {
          if (GetXDataHandler.favoriteList.isEmpty) {
            return Center(
              child: Text(
                CommonString.noUserFound,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: GetXDataHandler.favoriteList.length,
            itemBuilder: (context, index) =>
                UserCard(index: index, user: GetXDataHandler.favoriteList),
          );
        },
      ),
    );
  }
}
