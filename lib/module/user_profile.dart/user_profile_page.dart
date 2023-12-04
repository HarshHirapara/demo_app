import 'package:demo_app/core/constant/common_colors_file.dart';
import 'package:demo_app/module/widget/common_favorite_button.dart';
import 'package:demo_app/module/widget/common_user_profile_avatar.dart';
import 'package:flutter/material.dart';

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
                Row(
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.cake,
                        color: CommonColors.deepPurple,
                      ),
                      title: Text(
                        '${user[index]['birthDate']}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.abc,
                        color: CommonColors.deepPurple,
                      ),
                      title: Text(
                        '${user[index]['website']}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.business,
                        color: CommonColors.deepPurple,
                      ),
                      title: Text(
                        '${user[index]['company']}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: CommonColors.deepPurple,
                      ),
                      title: Text(phone.substring(10)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: CommonColors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: CommonColors.deepPurple,
                      ),
                      title: Text(
                        '${user[index]['address']}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
