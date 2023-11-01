import 'package:flutter/material.dart';

class grab_Or_Gone extends StatefulWidget {
  const grab_Or_Gone({Key? key}) : super(key: key);

  @override
  State<grab_Or_Gone> createState() => _grab_Or_Gone();
}

class _grab_Or_Gone extends State<grab_Or_Gone> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> imagePaths = [
    'assets/images/a1.webp',
    'assets/images/a2.webp',
    'assets/images/a3.webp',
    'assets/images/a4.webp',
    'assets/images/a5.webp',
    'assets/images/a6.webp',
    'assets/images/a7.webp',
    'assets/images/a8.webp',
    'assets/images/a9.webp',
    'assets/images/a10.webp',
    'assets/images/a11.webp',
    'assets/images/a12.webp',
    'assets/images/a13.webp',
    'assets/images/a14.webp',
    'assets/images/a15.webp',
    'assets/images/a16.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Grab Or Gone Deals',
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
        SizedBox(height: 10,),
        Container(
          height: 300,
          child: ListView.builder(
            controller: controller,
            itemCount: imagePaths.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double aspectRatio = 4 / 3;

              return Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
