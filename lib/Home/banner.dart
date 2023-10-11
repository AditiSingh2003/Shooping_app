import 'package:flutter/material.dart';

class BannerScroll extends StatefulWidget {
  const BannerScroll({super.key});

  @override
  State<BannerScroll> createState() => _BannerScrollState();
}

class _BannerScrollState extends State<BannerScroll> {
  List<String> ImagePath = [
    'assets/images/banner1.webp',
    'assets/images/banner2.webp',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
    'assets/images/banner5.jpg',
    'assets/images/banner6.webp',
    'assets/images/banner.7.webp',
    'assets/images/banner8.jpg',
    'assets/images/banner8.webp',
    'assets/images/banner9.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 9,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => 
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(ImagePath[index]),
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
