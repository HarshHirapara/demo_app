import 'package:demo_app/core/database/getx_functions.dart';
import 'package:demo_app/module/widget/common_widget_user_card.dart';
import 'package:flutter/material.dart';

class FavoriteUserScreen extends StatelessWidget {
  const FavoriteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
      ),
      body: ListView.builder(
        itemCount: GetXFunctions.favoriteList.length,
        itemBuilder: (context, index) =>
            UserCard(index: index, userList: GetXFunctions.favoriteList),
      ),
    );
  }
}
