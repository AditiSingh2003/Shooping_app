import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/scrollScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerScroll extends StatefulWidget {
  const BannerScroll({Key? key}) : super(key: key);

  @override
  State<BannerScroll> createState() => _BannerScrollState();
}

class _BannerScrollState extends State<BannerScroll> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths = [
    'assets/images/banner1.webp',
    'assets/images/banner2.webp',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
    'assets/images/banner5.jpg',
    'assets/images/banner6.webp',
    'assets/images/banner.7.webp',
    'assets/images/banner8.jpg',
    'assets/images/banner8.webp',
    'assets/images/banner9.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: imagePaths.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: (){
                  try {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListScroll()));
                } catch (e) {
                  print("Navigation error: $e");
                }
                },
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(imagePaths[index]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: imagePaths.length,
            effect: WormEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
