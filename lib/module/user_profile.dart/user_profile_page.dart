import 'package:demo_app/core/constant/common_colors.dart';
import 'package:demo_app/module/widget/common_divider.dart';
import 'package:demo_app/module/widget/common_favorite_button.dart';
import 'package:demo_app/module/widget/common_user_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../widget/common_list_tile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.index, required this.user});
  final int index;
  final List<Map<String, dynamic>> user;

  @override
  Widget build(BuildContext context) {
    final String phone = user[index]['phone'];
    final String firstName = user[index]['firstName'];
    final String lastName = user[index]['lastName'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${user[index]['firstName']} ${user[index]['lastName']}',
        ),
        actions: [
          CommonFavoriteButton(index: index, user: user),
        ],
      ),
      body: Padding(
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
    );
  }
}
