import 'package:flutter/material.dart';

class CatScroll extends StatefulWidget {
  const CatScroll({super.key});

  @override
  State<CatScroll> createState() => _CatScrollState();
}

class _CatScrollState extends State<CatScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CatScrollList(),
        ],
      ),
    );
  }
}

class CatScrollList extends StatefulWidget {
  const CatScrollList({super.key});

  @override
  State<CatScrollList> createState() => _CatScrollListState();
}

class _CatScrollListState extends State<CatScrollList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) => 
                Row(
                  children: [
                    Container(
                      height: 150,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              child: Image.asset('assets/images/ma1.webp'),
                              ),
                            Container(
                              child: Text('Hot Deals'),
                              ),
                          ],
                      ),
                      ),
                    )
                  ]
                )
              ),
            ),
    );
  }
}