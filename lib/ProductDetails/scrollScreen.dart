import 'package:flutter/material.dart';
import 'package:shopping_app/BootomNavBar/profile.dart';
import 'package:shopping_app/NavBar/AddTocart.dart';
import 'package:shopping_app/NavBar/Wishlist.dart';
import 'package:shopping_app/Widget/product.dart';

class ListScroll extends StatefulWidget {
  const ListScroll({super.key});

  @override
  State<ListScroll> createState() => _ListScrollState();
}

class _ListScrollState extends State<ListScroll> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      switch(index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/wishlist');
          break;
        case 2:
          Navigator.pushNamed(context, '/cart');
          break;
        case 3:
          Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  icon: Icon(Icons.notifications_active_outlined),
                  onPressed: () {
                    // Handle bell action
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishlistPage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    // Handle heart action
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addToCart()));
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
      body: Column(
        children: [
          Expanded(
            child: Product()
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
            color:  Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined,
            color:  Colors.black,),
            label: 'Wishlist',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
            color:  Colors.black,),
            label: 'Cart',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
            color: Colors.black,),
            label: 'Account',

            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      )
    );
  }
}