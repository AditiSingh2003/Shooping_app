import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/scrollScreen.dart';

class CatScroll extends StatefulWidget {
  const CatScroll({super.key});

  @override
  State<CatScroll> createState() => _CatScrollState();
}

class _CatScrollState extends State<CatScroll> {
  List<String> ImagePath = [
    'assets/images/ma1.webp',
    'assets/images/ma2.webp',
    'assets/images/ma3.webp',
    'assets/images/ma4.webp',
    'assets/images/ma5.webp',
    'assets/images/ma6.webp',
    'assets/images/ma7.webp',
    'assets/images/ma8.webp',
    'assets/images/ma9.webp',
    'assets/images/ma10.webp',
    'assets/images/ma11.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => 
              GestureDetector(
                onTap: (){
                  try {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListScroll()));
                } catch (e) {
                  print("Navigation error: $e");
                }
                },
                child : Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.asset(ImagePath[index]),
                      ),
                      SizedBox(height: 5,),
                      
                    ],
                  ),
                ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
