import 'package:flutter/material.dart';
import 'package:shopping_app/ProductDetails/scrollScreen.dart';

class complete_Look extends StatefulWidget {
  const complete_Look({Key? key}) : super(key: key);

  @override
  State<complete_Look> createState() => _complete_Look();
}

class _complete_Look extends State<complete_Look> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths1 = [
    'assets/images/r1.webp',
    'assets/images/r2.webp',
    'assets/images/r3.webp',
    'assets/images/r4.webp',
    'assets/images/r5.webp',
    'assets/images/r6.webp',
    'assets/images/r7.webp',
    'assets/images/r8.webp',
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
                  'Complete Look',
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
                ),
              );
            }
            ),
        ),
      ],
    );
  }
}
