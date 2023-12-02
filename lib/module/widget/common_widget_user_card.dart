import 'dart:developer';

import 'package:demo_app/core/database/getx_functions.dart';
import 'package:flutter/material.dart';
import '../../core/constant/common_colors_file.dart';
import '../../core/model/user_model_class.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.index, required this.userList});
  final int index;
  final List<UserModel> userList;

  @override
  State<UserCard> createState() => _UserCardState();
}

Icon favoriteBorder = const Icon(Icons.favorite_border);

class _UserCardState extends State<UserCard> {
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
                      IconButton(
                        onPressed: () {},
                        icon: favoriteBorder,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 55,
                  ),
                  Text(
                    '${widget.userList[widget.index].id} | ${widget.userList[widget.index].firstName} ${widget.userList[widget.index].lastName}',
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' ${widget.userList[widget.index].email}',
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
                              '${widget.userList[widget.index].address.street} ${widget.userList[widget.index].address.suite} ${widget.userList[widget.index].address.city} ${widget.userList[widget.index].address.zipCode}',
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
                          text: widget.userList[widget.index].website,
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
                          text: widget.userList[widget.index].website,
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
                      Text('${widget.userList[widget.index].phone}'),
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
