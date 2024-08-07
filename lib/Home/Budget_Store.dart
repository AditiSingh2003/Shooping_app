import 'package:flutter/material.dart';

import '../ProductDetails/scrollScreen.dart';

class BudgetStore extends StatefulWidget {
  const BudgetStore({Key? key}) : super(key: key);

  @override
  State<BudgetStore> createState() => _BudgetStore();
}

class _BudgetStore extends State<BudgetStore> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/b1.webp',
    'assets/images/b2.webp',
    'assets/images/b3.webp',
    'assets/images/b4.webp',
    'assets/images/b5.webp',
    'assets/images/b6.webp',
    'assets/images/b7.webp',
    'assets/images/g1.webp',
    'assets/images/g2.webp',
    'assets/images/g3.webp',
    'assets/images/g4.webp',
  ];

  List <String> imagePaths2 = [
    'assets/images/g5.webp',
    'assets/images/g6.webp',
    'assets/images/g7.webp',
    'assets/images/g8.webp',
    'assets/images/g9.webp',
    'assets/images/g10.webp',
    'assets/images/g11.webp',
    'assets/images/g12.webp',
    'assets/images/g13.webp',
    'assets/images/g14.webp',
    'assets/images/g15.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
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
                  'More On Categories',
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
          height: 400,
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
