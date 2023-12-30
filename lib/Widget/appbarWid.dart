import 'package:flutter/material.dart';

class AppbarWid extends StatefulWidget {
  const AppbarWid({super.key});

  @override
  State<AppbarWid> createState() => _AppbarWidState();
}

class _AppbarWidState extends State<AppbarWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('ang',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFF08080),
                fontWeight: FontWeight.bold
              ),
              ),
            ],
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Handle search action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_active_outlined),
                  onPressed: () {
                    // Handle bell action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    // Handle heart action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    // Handle cart action
                  },
                ),
              ],
            ),
          ],
      ),
    );
  }
}