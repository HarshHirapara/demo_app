import 'package:demo_app/core/constant/color_common_file.dart';
import 'package:demo_app/core/constant/icon_common_file.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.black45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50.00,
                    // child: Image.network(
                    //     'https://images.unsplash.com/photo-1701273973387-8abff988bb88?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Harsh Hirapara',
                      style: TextStyle(color: CommonColors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Divider(
                thickness: 0.7,
                color: CommonColors.white,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: Icon(
                Icons.home,
                color: CommonColors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 25, color: CommonColors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 10),
              child: Divider(
                thickness: 0.3,
                color: CommonColors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: SizedBox(
                child: CommonIcons.favorite,
              ),
              iconColor: CommonColors.red,
              title: Text(
                'Favorite',
                style: TextStyle(fontSize: 23, color: CommonColors.yellow),
              ),
            ),
          ],
        ),
      ),
      body: const Center(),
    );
  }
}
