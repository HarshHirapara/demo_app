import 'package:demo_app/core/constant/common_icons.dart';
import 'package:demo_app/core/constant/common_string.dart';
import 'package:demo_app/module/user_profile.dart/user_profile_page.dart';
import 'package:demo_app/module/widget/common_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/common_colors.dart';
import '../../core/getx/getx_handler.dart';
import 'common_divider.dart';
import 'common_user_profile_avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.index,
    required this.user,
    required this.isFavoriteScreen,
  });
  final int index;
  final List<Map<String, dynamic>> user;
  final bool isFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    final String phone = user[index]['phone'];
    final String firstName = user[index]['firstName'];
    final String lastName = user[index]['lastName'];
    return GestureDetector(
      onLongPress: () {
        Get.to(() => UserProfile(index: index, user: user));
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
                          isFavoriteScreen
                              ? Obx(
                                  () => IconButton(
                                    onPressed: () async {
                                      if (GetXDataHandler.favoriteList
                                          .contains(user[index])) {
                                        GetXDataHandler.favoriteList
                                            .removeWhere((element) =>
                                                element == user[index]);
                                      } else {
                                        GetXDataHandler.favoriteList
                                            .add(user[index]);
                                      }
                                    },
                                    icon: user.isEmpty
                                        ? CommonIcons.favoriteBorder
                                        : GetXDataHandler.favoriteList
                                                .contains(user[index])
                                            ? CommonIcons.favorite
                                            : CommonIcons.favoriteBorder,
                                  ),
                                )
                              : CommonFavoriteButton(index: index, user: user)
                        ],
                      ),
                      CommonUserProfileAvatar(
                          firstName: firstName, lastName: lastName),
                      Text(
                        '${user[index]['id']} | ${user[index]['firstName']} ${user[index]['lastName']}',
                        style: TextStyle(
                          color: CommonColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${user[index]['email']}',
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
                              text: user[index]['website'],
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
                              text: user[index]['address'],
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
                              text: user[index]['company'],
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
  }
}
