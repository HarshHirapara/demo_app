import 'package:demo_app/core/database/getx_functions.dart';
import 'package:demo_app/module/widget/common_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FavoriteUserScreen extends StatelessWidget {
  const FavoriteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
      ),
      body: Obx(
        () {
          if (GetXFunctions.favoriteList.isEmpty) {
            return const Center(
              child: Text(
                'No Favorite User Found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return ListView.builder(
            itemCount: GetXFunctions.favoriteList.length,
            itemBuilder: (context, index) =>
                UserCard(index: index, user: GetXFunctions.favoriteList),
          );
        },
      ),
    );
  }
}
