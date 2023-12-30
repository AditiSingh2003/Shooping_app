// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../ProductDetails/ProductDetails.dart';

// class FetchData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fetch Data'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('items').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No data available.'),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot document = snapshot.data!.docs[index];
//               Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//               // Extracting image URLs
//               String imageUrl1 = data['i1'];
//               String imageUrl2 = data['i2'];

//               return Container(
//       child: GestureDetector(
//         onTap: (){
//           Navigator.push(context,
//           MaterialPageRoute(builder: (context) => ProductDetails()));
//         },
//         child: Column(
//           children: [
//             Card(
//               color: Colors.grey[400],
//               child: Column(
//                 children: [
//                   Image.network(imageUrl1, fit: BoxFit.cover),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Iphone 12",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500
//                       ),
//                       ),
//                       // IconButton(onPressed: toogleColor,
//                       //   color: isFav ? Colors.red : Colors.black,
//                       // icon: Icon(
//                       //   isFav ? Icons.favorite : Icons.favorite_border_outlined,
//                       // ),
//                       // ),
//                   ],),
//                   Text( '${data['description']}',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400
//                   ),
//                   ),
//                   Row(
//                     children: [
//                       Text('${data['offPrice']}',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500
//                       ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('${data['mrp']}}',
//                       style: TextStyle(
//                         fontSize: 16,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('${data['offer']}% off',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.green,
//                       ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 10,)
//           ],
//         ),
//       ),
//     );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
