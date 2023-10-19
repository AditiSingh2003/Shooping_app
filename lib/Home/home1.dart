import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1();
}

class _Home1 extends State<Home1> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths = [
    'assets/images/mc1.webp',
    'assets/images/mc2.webp',
    'assets/images/mc3.webp',
    'assets/images/mc4.jpg',
    'assets/images/mc5.webp',
    'assets/images/mc6.webp',
    'assets/images/mc7.webp',
    'assets/images/mc8.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sale Ends In 2 Days',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: imagePaths.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double aspectRatio = 4 / 3;

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Set your desired border radius
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
