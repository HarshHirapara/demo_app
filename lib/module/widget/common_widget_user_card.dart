import 'package:demo_app/core/constant/common_icons_file.dart';
import 'package:flutter/material.dart';
import '../../core/constant/common_colors_file.dart';
import '../../core/model/user_model_class.dart';

class UserCard extends StatelessWidget {
  final int index;
  final List<UserModel> userList;
  const UserCard({super.key, required this.index, required this.userList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(CommonIcons.favorite.icon),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 55,
                  ),
                  Text(
                    '${userList[index].id} | ${userList[index].firstName} ${userList[index].lastName}',
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' ${userList[index].email}',
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
                          text: 'Address : ',
                          style: TextStyle(
                            color: CommonColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${userList[index].address.street} ${userList[index].address.suite} ${userList[index].address.city} ${userList[index].address.zipCode}',
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
                          text: 'Website  : ',
                          style: TextStyle(
                            color: CommonColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: userList[index].website,
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
                          text: userList[index].website,
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
                      const Icon(Icons.phone),
                      // Icon(Icons.location_on),
                      Text('${userList[index].phone}'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
