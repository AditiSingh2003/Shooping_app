import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final TextEditingController productName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController mrp = TextEditingController();
  final TextEditingController offPrice = TextEditingController();
  final TextEditingController offer = TextEditingController();
  final TextEditingController i1 = TextEditingController();
  final TextEditingController i2 = TextEditingController();
  final TextEditingController id = TextEditingController();
  int i=1;
  final ImagePicker _picker = ImagePicker();
  
  void insertData(){
    CollectionReference items = FirebaseFirestore.instance.collection('items');
    items.add({
      'productName': productName.text,
      'description': description.text,
      'mrp': mrp.text,
      'offPrice': offPrice.text,
      'offer': offer.text,
      'i1': i1.text,
      'i2': i2.text,
      'id': id.text,
    });
  }

  Future<void> selectImageFromGallery() async {
  var status = await Permission.photos.request();
  if (status.isGranted) {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        i1.text = pickedImage.path;
      });
    }
  } else {
    print('Permission denied');
  }
}

  Future<void> selectImageFromGallery2() async {
  var status = await Permission.photos.request();
  if (status.isGranted) {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        i2.text = pickedImage.path;
      });
    }
  } else {
    print('Permission denied');
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: productName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Name',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: mrp,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'MRP',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: offPrice,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Off Price',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: offer,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Offer',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: selectImageFromGallery,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: i1.text.isNotEmpty
                          ? Image.file(
                              File(i1.text),
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text('Tap to select image'),
                            ),
                    ),
                    SizedBox(height: 8),
                    Text('Image 1'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: selectImageFromGallery2,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: i2.text.isNotEmpty
                          ? Image.file(
                              File(i2.text),
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text('Tap to select image'),
                            ),
                    ),
                    SizedBox(height: 8),
                    Text('Image 2'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: Text(
                'Insert',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary:Color(0xFFF08080),
                onPrimary: Colors.black,
                minimumSize: Size(MediaQuery.of(context).size.width/2, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}