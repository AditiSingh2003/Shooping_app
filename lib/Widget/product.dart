import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isFav = false;

  void toogleColor(){
    setState(() {
      isFav = !isFav;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductDetails()));
        },
        child: Column(
          children: [
            Card(
              color: Colors.grey[400],
              child: Column(
                children: [
                  Image.asset('assets/images/WomenBag3.webp'),
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
                      Text("Iphone 12",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      IconButton(onPressed: toogleColor,
                        color: isFav ? Colors.red : Colors.black,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      ),
                      ),
                  ],),
                  Text('Inktree Back Cover for Apple iPhone 14 Back Cover | Slim Soft Back Case for Apple iPhone 14 (Transparent)',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Row(
                    children: [
                      Text('₹499',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('₹999',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('50% off',
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
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}