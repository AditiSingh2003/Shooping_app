import 'package:flutter/material.dart';

import '../ProductDetails/scrollScreen.dart';

class more_You_Need extends StatefulWidget {
  const more_You_Need({Key? key}) : super(key: key);

  @override
  State<more_You_Need> createState() => _more_You_Need();
}

class _more_You_Need extends State<more_You_Need> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/c1.webp',
    'assets/images/c2.webp',
    'assets/images/c3.webp',
    'assets/images/c4.webp',
    'assets/images/c5.webp',
    'assets/images/c6.webp',
    'assets/images/c7.webp',
    'assets/images/c8.webp',
    'assets/images/c9.webp',
    'assets/images/c10.webp',
    'assets/images/c11.webp',
    'assets/images/c12.webp',
  ];

  List <String> imagePaths2 = [
    'assets/images/c13.webp',
    'assets/images/c14.webp',
    'assets/images/c15.webp',
    'assets/images/c16.webp',
    'assets/images/c17.webp',
    'assets/images/c18.webp',
    'assets/images/c19.webp',
    'assets/images/c20.webp',
    'assets/images/c21.webp',
    'assets/images/c22.webp',
    'assets/images/c23.webp',
    'assets/images/c24.webp',
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
                  'More You Need',
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
          height: 420,
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
                        const SizedBox(height: 10,),
                        Container( // Set your desired border radius
                            child: Image.asset(
                              imagePaths1[index],
                              width: 150,
                              fit: BoxFit.cover,
                          ),
                        ),
                        
                        const SizedBox(height: 5,),
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
