import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CatScroll extends StatefulWidget {
  const CatScroll({super.key});

  @override
  State<CatScroll> createState() => _CatScrollState();
}

class _CatScrollState extends State<CatScroll> {
  final controller = PageController(
    initialPage: 0,
  );

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
            height: 80,
            child: ListView.builder(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => 
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.asset(ImagePath[index]),
                      ),
                      SizedBox(height: 5,),
                      SmoothPageIndicator(
                      controller: controller, 
                      count: ImagePath.length,
                      effect: WormEffect(), // you can change the effect as needed
                    ),
                    ],
                  ),
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}
