import 'package:flutter/material.dart';

import '../ProductDetails/scrollScreen.dart';

class best_On_Melang extends StatefulWidget {
  const best_On_Melang({Key? key}) : super(key: key);

  @override
  State<best_On_Melang> createState() => _best_On_Melang();
}

class _best_On_Melang extends State<best_On_Melang> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/d2.webp',
    'assets/images/d3.webp',
    'assets/images/d4.webp',
    'assets/images/d5.webp',
    'assets/images/d6.webp',
    'assets/images/d7.webp',
    'assets/images/d8.webp',
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
                  'Best On Melang',
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
          height: 280,
          child: ListView.builder(
            controller: controller,
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
