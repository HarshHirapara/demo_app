import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/database/getx_functions.dart';

class CommonFavoriteButton extends StatelessWidget {
  const CommonFavoriteButton(
      {super.key, required this.index, required this.user});
  final int index;
  final List<Map<String, dynamic>> user;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (GetXFunctions.favoriteList.contains(user[index])) {
          GetXFunctions.favoriteList
              .removeWhere((element) => element == user[index]);
        } else {
          GetXFunctions.favoriteList.add(user[index]);
          log(GetXFunctions.favoriteList.length.toString());
        }
      },
      icon: Obx(
        () => GetXFunctions.favoriteList.contains(user[index])
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
