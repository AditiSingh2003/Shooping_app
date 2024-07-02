import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}
class _ProductState extends State<Product> {
  bool isFav = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
            return const Center(
              child: Text('No data available.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              // Extracting image URLs
              String imageUrl1 = data['i1'];
              String imageUrl2 = data['i2'];

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
                              style: const TextStyle(
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
                                style: const TextStyle(
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
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('₹ ${data['mrp']}',
                              style: const TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${data['offer']}% off',
                              style: const TextStyle(
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
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            );
            },
          );
        },
      ),
    );
  }
}
