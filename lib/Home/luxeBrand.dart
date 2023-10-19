import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class luxe_Brand extends StatefulWidget {
  const luxe_Brand({Key? key}) : super(key: key);

  @override
  State<luxe_Brand> createState() => _luxe_Brand();
}

class _luxe_Brand extends State<luxe_Brand> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/h1.webp',
    'assets/images/h2.webp',
    'assets/images/h3.webp',
    'assets/images/h4.webp',
    'assets/images/h5.webp',
    'assets/images/h6.webp',
    'assets/images/h7.webp',
    'assets/images/h8.webp',
    'assets/images/h9.webp',
    'assets/images/h10.webp',
    'assets/images/h11.webp',
    'assets/images/h12.webp',
    'assets/images/h13.webp',
    'assets/images/h14.webp',
    'assets/images/h15.webp',
    'assets/images/h16.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Luxe Brand',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            controller: controller,
            itemCount: imagePaths1.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      Container( // Set your desired border radius
                          child: Image.asset(
                            imagePaths1[index],
                            width: 150,
                            fit: BoxFit.cover,
                        ),
                      ),
                    ],
                ),
                ),
              );
            }
            ),
        ),
      ],
    );
  }
}
