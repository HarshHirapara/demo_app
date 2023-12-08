import 'package:demo_app/core/constant/common_colors.dart';
import 'package:demo_app/module/widget/common_divider.dart';
import 'package:demo_app/module/widget/common_favorite_button.dart';
import 'package:demo_app/module/widget/common_user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/common_icons.dart';
import '../../core/getx/getx_handler.dart';
import '../widget/common_list_tile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile(
      {super.key,
      required this.index,
      required this.user,
      required this.isFavoriteScreen});
  final int index;
  final List<Map<String, dynamic>> user;
  final bool isFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    Rx<bool> isUserFavorite = true.obs;
    List<Map<String, dynamic>> tampListAdd = [];
    List<Map<String, dynamic>> tampListRemove = [];
    final String phone = user[index]['phone'];
    final String firstName = user[index]['firstName'];
    final String lastName = user[index]['lastName'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            for (var i = 0; i < tampListRemove.length; i++) {
              GetXDataHandler.favoriteList
                  .removeWhere((element) => element == tampListRemove[i]);
            }
            for (var i = 0; i < tampListAdd.length; i++) {
              GetXDataHandler.favoriteList.add(tampListAdd[i]);
            }
            tampListRemove.clear();
            tampListAdd.clear();
            Get.back();
          },
          icon: CommonIcons.backArrow,
        ),
        automaticallyImplyLeading: !isFavoriteScreen,
        title: Text(
          '${user[index]['firstName']} ${user[index]['lastName']}',
        ),
        actions: [
          isFavoriteScreen
              ? Obx(
                  () => IconButton(
                    onPressed: () {
                      if (isUserFavorite.value) {
                        isUserFavorite.value = false;
                        if (tampListRemove
                            .contains(GetXDataHandler.favoriteList[index])) {
                          return;
                        } else {
                          tampListRemove
                              .add(GetXDataHandler.favoriteList[index]);
                          GetXDataHandler.favoriteList[index].remove;
                        }
                      } else {
                        isUserFavorite.value = true;
                        if (tampListAdd
                            .contains(GetXDataHandler.favoriteList[index])) {
                          return;
                        } else {
                          tampListAdd.add(GetXDataHandler.favoriteList[index]);
                        }
                      }
                    },
                    icon: isUserFavorite.value
                        ? CommonIcons.favorite
                        : CommonIcons.favoriteBorder,
                  ),
                )
              : CommonFavoriteButton(index: index, user: user),
        ],
      ),
      body: GestureDetector(
        onVerticalDragStart: (details) {
          for (var i = 0; i < tampListRemove.length; i++) {
            GetXDataHandler.favoriteList
                .removeWhere((element) => element == tampListRemove[i]);
          }
          for (var i = 0; i < tampListAdd.length; i++) {
            GetXDataHandler.favoriteList.add(tampListAdd[i]);
          }
          tampListRemove.clear();
          tampListAdd.clear();
          Get.back();
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CommonUserProfileAvatar(
                                firstName: firstName, lastName: lastName),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${user[index]['firstName']} ${user[index]['lastName']}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${user[index]['email']}',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CommonDivider(
                        left: 70,
                        right: 10,
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                      CommonListTile(
                        icon: const Icon(Icons.cake),
                        title: '${user[index]['birthDate']}',
                      ),
                      CommonDivider(
                        left: 70,
                        right: 10,
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                      CommonListTile(
                        icon: const Icon(Icons.perm_identity),
                        title: '${user[index]['website']}',
                      ),
                      CommonDivider(
                        left: 70,
                        right: 10,
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                      CommonListTile(
                        icon: const Icon(Icons.business),
                        title: '${user[index]['company']}',
                      ),
                      CommonDivider(
                        left: 70,
                        right: 10,
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                      CommonListTile(
                        icon: const Icon(Icons.phone),
                        title: phone.substring(10),
                      ),
                      CommonDivider(
                        left: 70,
                        right: 10,
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                      CommonListTile(
                        icon: const Icon(Icons.location_on),
                        title: '${user[index]['address']}',
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
