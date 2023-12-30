import 'package:cloud_firestore/cloud_firestore.dart';

void wishListAdd(
  String productName,
  String description,
  String mrp,
  String offPrice,
  String offer,
  String i1,
) {
  CollectionReference wishList = FirebaseFirestore.instance.collection('WishList');
  wishList.add({
    'productName': productName,
    'description': description,
    'mrp': mrp,
    'offPrice': offPrice,
    'offer': offer,
    'i1': i1,
  });
}

Future<void> deleteProductByName(String productName) async {
  try {
    CollectionReference wishList = FirebaseFirestore.instance.collection('WishList');
    QuerySnapshot querySnapshot = await wishList.where('productName', isEqualTo: productName).get();
    if (querySnapshot.docs.isNotEmpty) {
      await wishList.doc(querySnapshot.docs.first.id).delete();
      print('Product deleted from WishList successfully');
    } else {
      print('Product not found in the WishList');
    }
  } catch (e) {
    print('Error deleting product from WishList: $e');
  }
}
