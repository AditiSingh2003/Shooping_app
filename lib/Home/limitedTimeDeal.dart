import 'package:flutter/material.dart';

import '../ProductDetails/scrollScreen.dart';

class limited_Time extends StatefulWidget {
  const limited_Time({Key? key}) : super(key: key);

  @override
  State<limited_Time> createState() => _limited_Time();
}

class _limited_Time extends State<limited_Time> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/f1.webp',
    'assets/images/f2.webp',
    'assets/images/f3.webp',
    'assets/images/f4.webp',
    'assets/images/f5.webp',
    'assets/images/f6.webp',
    'assets/images/f7.webp',
    'assets/images/f8.webp',
    'assets/images/f9.webp',
    'assets/images/f10.webp',
    'assets/images/f11.webp',
    'assets/images/f12.webp',
    'assets/images/f13.webp',
    'assets/images/f14.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 50,
              child: Image.asset('assets/images/Heading.png',
              width:MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              )
              ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  'Limited Time Deals',
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
        SizedBox(
          height: 200,
          child: ListView.builder(
            controller: controller,
            itemCount: imagePaths1.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index)
            {
              return GestureDetector(
                onTap: (){
                  try {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListScroll()));
                } catch (e) {
                  print("Navigation error: $e");
                }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
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
                ),
              );
            }
            ),
        ),
      ],
    );
  }
}
