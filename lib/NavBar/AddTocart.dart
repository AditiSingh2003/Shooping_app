import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/ProductDetails.dart';
import 'package:shopping_app/Widget/addCart.dart';

class addToCart extends StatefulWidget {
  const addToCart({super.key});

  @override
  State<addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<addToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('WishList').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
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
                          deleteProductByNameCart(product);
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
                            child: Text( 'Remove from Cart',
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
    );
  }
}