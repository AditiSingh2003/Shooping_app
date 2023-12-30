import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../ProductDetails/scrollScreen.dart';

class treading_Brand extends StatefulWidget {
  const treading_Brand({Key? key}) : super(key: key);

  @override
  State<treading_Brand> createState() => _treading_Brand();
}

class _treading_Brand extends State<treading_Brand> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/e1.webp',
    'assets/images/e2.webp',
    'assets/images/e3.webp',
    'assets/images/e4.webp',
    'assets/images/e5.webp',
    'assets/images/e6.webp',
    'assets/images/e7.webp',
    'assets/images/e8.webp',
    'assets/images/e9.webp',
    'assets/images/e10.webp',
    'assets/images/e11.webp',
    'assets/images/e12.webp',
  ];

  List <String> imagePaths2 = [
    'assets/images/e13.webp',
    'assets/images/e14.webp',
    'assets/images/e15.webp',
    'assets/images/e16.webp',
    'assets/images/e17.webp',
    'assets/images/e18.webp',
    'assets/images/e19.webp',
    'assets/images/e20.webp',
    'assets/images/e21.webp',
    'assets/images/e22.webp',
    'assets/images/e23.webp',
    'assets/images/e24.webp',
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
                  'Treading Brands On Melang',
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
          height: 520,
          child: ListView.builder(
            controller: controller,
            itemCount: imagePaths1.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index)
            {
              return GestureDetector(
                onTap: (){
                  try {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListScroll()));
                } catch (e) {
                  print("Navigation error: $e");
                }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container( // Set your desired border radius
                            child: Image.asset(
                              imagePaths1[index],
                              width: 150,
                              fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container( // Set your desired border radius
                            child: Image.asset(
                              imagePaths2[index],
                              width: 150,
                              fit: BoxFit.cover,
                          ),
                        ),
                      ],
                  ),
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
