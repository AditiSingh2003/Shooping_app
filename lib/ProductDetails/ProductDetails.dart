import 'package:flutter/material.dart';
import 'package:shopping_app/AddToCart/AddTocart.dart';
import 'package:shopping_app/WishList/Wishlist.dart';
import 'package:shopping_app/AddToCart/addCartFunctionality.dart';
import 'package:shopping_app/WishList/wishlistFunctionality.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  final String productName;
  final String description;
  final String i1;
  final String mrp;
  final String offerPrice;
  final String offer;
  final String documentId;

  const ProductDetails({
    Key? key,
    required this.productName,
    required this.description,
    required this.i1,
    required this.mrp,
    required this.offerPrice,
    required this.offer,
    required this.documentId,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState(

  );
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = PageController(initialPage: 0);
  bool isFav = false;
  int selectedSizeIndex = -1;
  bool isCart = false;
  List<String> wishlist = [];

  void selectSize(int index) {
    setState(() {
      if (selectedSizeIndex == index) {
        selectedSizeIndex = -1;
      } else {
        selectedSizeIndex = index;
      }
    });
  }

  void toogleColor( productName,  description,  mrp, offPrice, offer, i1, documentId) {
  setState(() {
    isFav = !isFav;
    if (isFav) {
      // Add to wishlist
      wishListAdd(productName, description, mrp, offPrice, offer, i1);
      wishlist.add(productName);
    } else {
      // Remove from wishlist
      deleteProductByName(productName);
      wishlist.remove(productName);
    }
  });
}


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('ang',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFF08080),
                fontWeight: FontWeight.bold
              ),
              ),
            ],
          ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_active_outlined),
                  onPressed: () {
                    // Handle bell action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    // Handle heart action
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const WishlistPage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    // Handle cart action
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const addToCart()));
                  },
                ),
              ],
            ),
          ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.i1,
                fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const WormEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                ),
                ),
              ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(widget.description,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        toogleColor(widget.productName, widget.description, widget.mrp, widget.offerPrice, widget.offer, widget.i1, widget.documentId);
                      },
                      color: isFav ? Colors.red : Colors.black,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text( '₹',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    Text( widget.offerPrice,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('MRP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey
                    ),
                    ),
                    Text(widget.mrp,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text( widget.offer,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green
                    ),
                    ),
                    const Text('% off',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const Text('CHECK DELIVEREY & SERVICES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pincode',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.delivery_dining_outlined,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      const SizedBox(width: 10,),
                      Text('Get it by Mon',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      const SizedBox(width: 10,),
                      Text('Pay On Delivery Available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.swap_calls,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      const SizedBox(width: 10,),
                      Text('Easy 14 days return and exchange policy',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('Select Size',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSizeButton(0, 'S'),
                      const SizedBox(width: 10,),
                      buildSizeButton(1, 'M'),
                      const SizedBox(width: 10,),
                      buildSizeButton(2, 'L'),
                      const SizedBox(width: 10,),
                      buildSizeButton(3, 'XL'),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      if (selectedSizeIndex == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a size'),
                          ),
                        );
                      } else {
                        setState(() {
                          addToCartAdd(widget.productName, widget.description, widget.mrp, widget.offerPrice, widget.offer, widget.i1);
                          isCart = true;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          isCart ? 'Go to Cart' : 'Add to Cart',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Product Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('•   Blue longline empire top',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        SizedBox(height: 10,),
                        Text('•   Ethnic motifs print ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        SizedBox(height: 10,),
                        Text('•   Mandarin collar,  cuffed sleeves ',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        SizedBox(height: 10,),
                        Text('•   Gathered or pleated detail ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Material & Care',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('The Model is wearing size S',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                    const SizedBox(height: 10,),
              ],
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }


Widget buildSizeButton(int index, String size) {
  return GestureDetector(
    onTap: () => selectSize(index),
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: selectedSizeIndex == index ? Colors.grey.shade800 : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: selectedSizeIndex == index ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
}