import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/NavBar/AddTocart.dart';

void addToCartAdd(
  String productName,
  String description,
  String mrp,
  String offPrice,
  String offer,
  String i1,
) {
  CollectionReference addToCart = FirebaseFirestore.instance.collection('AddToCart');
  addToCart.add({
    'productName': productName,
    'description': description,
    'mrp': mrp,
    'offPrice': offPrice,
    'offer': offer,
    'i1': i1,
  });
}

Future<void> deleteProductByNameCart(String productName) async {
  try {
    CollectionReference addtocart = FirebaseFirestore.instance.collection('AddToCart');
    QuerySnapshot querySnapshot = await addtocart.where('productName', isEqualTo: productName).get();
    if (querySnapshot.docs.isNotEmpty) {
      await addtocart.doc(querySnapshot.docs.first.id).delete();
      print('Product deleted from WishList successfully');
    } else {
      print('Product not found in the WishList');
    }
  } catch (e) {
    print('Error deleting product from WishList: $e');
  }
}
