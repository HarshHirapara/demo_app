import 'package:demo_app/module/user_profile.dart/user_profile_page.dart';
import 'package:demo_app/module/widget/common_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../core/constant/common_colors_file.dart';
import 'common_user_profile_avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.index, required this.user});
  final int index;
  final List<Map<String, dynamic>> user;

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
          color: index.isEven ? CommonColors.white : Colors.deepPurple.shade100,
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
                          CommonFavoriteButton(index: index, user: user)
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
                              text: 'Website  : ',
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
                      const Divider(thickness: 1),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Address : ',
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
                      const Divider(thickness: 1),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Company : ',
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
                      const Divider(thickness: 1),
                      Row(
                        children: [
                          const Icon(Icons.call),
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