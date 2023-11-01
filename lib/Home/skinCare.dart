import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class skin_Care extends StatefulWidget {
  const skin_Care({Key? key}) : super(key: key);

  @override
  State<skin_Care> createState() => _skin_Care();
}

class _skin_Care extends State<skin_Care> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/s1.webp',
    'assets/images/s2.webp',
    'assets/images/s3.webp',
    'assets/images/s4.webp',
    'assets/images/s5.webp',
    'assets/images/s6.webp',
    'assets/images/s7.webp',
    'assets/images/s8.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 50,
              child: Image.asset('assets/images/Heading.png',
              width:MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              )
              ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  'Skin Care',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: imagePaths1.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container( // Set your desired border radius
                          child: Image.asset(
                            imagePaths1[index],
                            width: MediaQuery.of(context).size.width,
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
