import 'package:flutter/material.dart';

class CurvedHeader extends StatefulWidget {
  const CurvedHeader({super.key});

  @override
  State<CurvedHeader> createState() => _CurvedHeaderState();
}

class _CurvedHeaderState extends State<CurvedHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.menu),
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
        toolbarHeight: 60,
        backgroundColor: Color(0xFFFFDE32),
        automaticallyImplyLeading: false,
      ),
    );
  }
}