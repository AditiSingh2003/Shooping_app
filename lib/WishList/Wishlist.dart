import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/BootomNavBar/profile.dart';
import 'package:shopping_app/WishList/wishlistFunctionality.dart';

import '../ProductDetails/ProductDetails.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _selectedIndex = 0;
  late final List<String> wishlist;

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
          Navigator.pushNamed(context, '/addtocart');
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
              Text('Wish',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('List',
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
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/addtocart');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('WishList').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Hold A Second!',
                maxLines: 3,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'Your Wishlist is empty',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
            DocumentSnapshot document =  snapshot.data!.docs[index];
            Map<String, dynamic> data  = document.data() as Map<String, dynamic>;

            String imageUrl1 = data['i1'];
            String product = data['productName'];

            return Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetails(
                    productName: "${data['productName']}",
                    description: "${data['description']}",
                    i1 : "${data['i1']}",
                    offerPrice:"${data['offPrice']}",
                    mrp : "${data['mrp']}",
                    offer : "${data['offer']}",
                    documentId : document.id,
                  )));
                },
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey[400],
                      child: Column(
                        children: [
                          Image.network(imageUrl1, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['productName']}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text( '${data['description']}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                                ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('₹ ${data['offPrice']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('₹ ${data['mrp']}',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${data['offer']}% off',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          deleteProductByName(product);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text( 'Remove from Wishlist',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ),
                        ),
                  ),
                  SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          }
          );
        }
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