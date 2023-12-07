import 'package:demo_app/core/constant/common_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/getx/getx_handler.dart';

class CommonFavoriteButton extends StatelessWidget {
  const CommonFavoriteButton(
      {super.key, required this.index, required this.user});
  final int index;
  final List<Map<String, dynamic>> user;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        onPressed: () {
          if (GetXDataHandler.favoriteList.contains(user[index])) {
            GetXDataHandler.favoriteList
                .removeWhere((element) => element == user[index]);
            Get.back();
          } else {
            GetXDataHandler.favoriteList.add(user[index]);
          }
        },
        icon: user.isEmpty
            ? CommonIcons.favoriteBorder
            : GetXDataHandler.favoriteList.contains(user[index])
                ? CommonIcons.favorite
                : CommonIcons.favoriteBorder,
      ),
    );
  }
}
