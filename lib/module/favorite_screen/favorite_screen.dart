import 'package:demo_app/core/constant/common_string.dart';
import 'package:demo_app/core/getx/getx_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../core/constant/common_colors.dart';
import '../../core/constant/common_icons.dart';
import '../user_profile.dart/user_profile_page.dart';
import '../widget/common_divider.dart';
import '../widget/common_user_profile_avatar.dart';

class FavoriteUserScreen extends StatelessWidget {
  const FavoriteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tampListAdd = [];
    List<Map<String, dynamic>> tampListRemove = [];
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
          return RefreshIndicator(
            onRefresh: () async {
              for (var i = 0; i < tampListRemove.length; i++) {
                GetXDataHandler.favoriteList
                    .removeWhere((element) => element == tampListRemove[i]);
              }
              for (var i = 0; i < tampListAdd.length; i++) {
                GetXDataHandler.favoriteList.add(tampListAdd[i]);
              }
              tampListRemove.clear();
              tampListAdd.clear();
            },
            child: ListView.builder(
              itemCount: GetXDataHandler.favoriteList.length,
              itemBuilder: (context, index) {
                Rx<bool> isUserFavorite = true.obs;
                final String phone =
                    GetXDataHandler.favoriteList[index]['phone'];
                final String firstName =
                    GetXDataHandler.favoriteList[index]['firstName'];
                final String lastName =
                    GetXDataHandler.favoriteList[index]['lastName'];
                return GestureDetector(
                  onLongPress: () {
                    Get.to(() => UserProfile(
                        index: index, user: GetXDataHandler.favoriteList));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 8,
                      color: index.isEven
                          ? CommonColors.white
                          : CommonColors.deepPurpleShade100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Obx(
                                        () => IconButton(
                                          onPressed: () {
                                            if (isUserFavorite.value) {
                                              isUserFavorite.value = false;
                                              tampListRemove.add(GetXDataHandler
                                                  .favoriteList[index]);
                                              GetXDataHandler
                                                  .favoriteList[index].remove;
                                            } else {
                                              isUserFavorite.value = true;
                                              tampListAdd.add(GetXDataHandler
                                                  .favoriteList[index]);
                                            }
                                          },
                                          icon: GetXDataHandler
                                                  .favoriteList.isEmpty
                                              ? CommonIcons.favoriteBorder
                                              : isUserFavorite.value
                                                  ? CommonIcons.favorite
                                                  : CommonIcons.favoriteBorder,
                                        ),
                                      )
                                    ],
                                  ),
                                  CommonUserProfileAvatar(
                                      firstName: firstName, lastName: lastName),
                                  Text(
                                    '${GetXDataHandler.favoriteList[index]['id']} | ${GetXDataHandler.favoriteList[index]['firstName']} ${GetXDataHandler.favoriteList[index]['lastName']}',
                                    style: TextStyle(
                                      color: CommonColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '${GetXDataHandler.favoriteList[index]['email']}',
                                    style: TextStyle(
                                      color: CommonColors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: CommonString.website,
                                          style: TextStyle(
                                            color: CommonColors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: GetXDataHandler
                                              .favoriteList[index]['website'],
                                          style: TextStyle(
                                            color: CommonColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const CommonDivider(thickness: 2),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: CommonString.address,
                                          style: TextStyle(
                                            color: CommonColors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: GetXDataHandler
                                              .favoriteList[index]['address'],
                                          style: TextStyle(
                                            color: CommonColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const CommonDivider(thickness: 2),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: CommonString.company,
                                          style: TextStyle(
                                            color: CommonColors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: GetXDataHandler
                                              .favoriteList[index]['company'],
                                          style: TextStyle(
                                            color: CommonColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Divider(thickness: 1),
                                  const CommonDivider(thickness: 2),
                                  Row(
                                    children: [
                                      CommonIcons.call,
                                      Text(
                                        phone.substring(10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
