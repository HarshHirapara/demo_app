import 'package:demo_app/core/database/getx_functions.dart';
import 'package:flutter/material.dart';
import '../../core/constant/common_colors_file.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.index, required this.user});
  final int index;
  final List<Map<String, dynamic>> user;

  @override
  State<UserCard> createState() => _UserCardState();
}

Icon favoriteBorder = const Icon(Icons.favorite_border);

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final firstName = widget.user[widget.index]['firstName'];
    final lastName = widget.user[widget.index]['lastName'];
    return Card(
      elevation: 5,
      color:
          widget.index.isEven ? CommonColors.white : Colors.deepPurple.shade100,
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
                        onPressed: () {
                          if (GetXFunctions.favoriteList
                              .contains(GetXFunctions.userList[widget.index])) {
                            GetXFunctions.favoriteList[widget.index].remove;

                            setState(() {});
                          } else {
                            GetXFunctions.favoriteList
                                .add(GetXFunctions.userList[widget.index]);
                            setState(() {});
                          }
                        },
                        icon: GetXFunctions.favoriteList
                                .contains(GetXFunctions.userList[widget.index])
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 55,
                    child: Text(
                      '${firstName[0]}${lastName[0]}',
                      style: const TextStyle(fontSize: 35),
                    ),
                  ),
                  Text(
                    '${widget.user[widget.index]['id']} | ${widget.user[widget.index]['firstName']} ${widget.user[widget.index]['lastName']}',
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${widget.user[widget.index]['email']}',
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: 15,
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
                        // TextSpan(
                        //   text:
                        //       '${widget.user[widget.index].address.street} ${widget.user[widget.index].address.suite} ${widget.user[widget.index].address.city} ${widget.user[widget.index].address.zipCode}',
                        //   style: TextStyle(
                        //     color: CommonColors.black,
                        //   ),
                        // ),
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
                        // TextSpan(
                        //   text: widget.user[widget.index].website,
                        //   style: TextStyle(
                        //     color: CommonColors.black,
                        //   ),
                        // ),
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
                        // TextSpan(
                        //   text: widget.user[widget.index].website,
                        //   style: TextStyle(
                        //     color: CommonColors.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      // Icon(Icons.location_on),
                      Text('${widget.user[widget.index]['phone']}'),
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
