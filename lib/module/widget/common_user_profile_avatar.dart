import 'package:flutter/material.dart';

class CommonUserProfileAvatar extends StatelessWidget {
  const CommonUserProfileAvatar(
      {super.key, required this.firstName, required this.lastName});
  final String firstName;
  final String lastName;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      child: Text(
        '${firstName[0]}${lastName[0]}',
        style: const TextStyle(fontSize: 35),
      ),
    );
  }
}
