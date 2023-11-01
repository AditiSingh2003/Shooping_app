import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = PageController(initialPage: 0);
  bool isFav = false;
  int selectedSizeIndex = -1;

  void selectSize(int index) {
    setState(() {
      if (selectedSizeIndex == index) {
        selectedSizeIndex = -1;
      } else {
        selectedSizeIndex = index;
      }
    });
  }

  void toogleColor(){
    setState(() {
      isFav = !isFav;
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/WomenTop3.webp',
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                ),
                ),
              ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text('QOMN Blue Print Mandarin Pure Cotton Longline Top',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      ),
                    ),
                    IconButton(
                      onPressed: toogleColor,
                      color: isFav ? Colors.red : Colors.black,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('₹999',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('MRP ₹1499',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey
                    ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('50% off',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text('CHECK DELIVEREY & SERVICES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pincode',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.delivery_dining_outlined,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      SizedBox(width: 10,),
                      Text('Get it by Mon',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      SizedBox(width: 10,),
                      Text('Pay On Delivery Available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.swap_calls,
                      size: 30,
                      color: Colors.grey.shade700
                      ),
                      SizedBox(width: 10,),
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
                  SizedBox(height: 10,),
                  Text('Select Size',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSizeButton(0, 'S'),
                      SizedBox(width: 10,),
                      buildSizeButton(1, 'M'),
                      SizedBox(width: 10,),
                      buildSizeButton(2, 'L'),
                      SizedBox(width: 10,),
                      buildSizeButton(3, 'XL'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Product Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
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
                    SizedBox(height: 10,),
                    Text('Material & Care',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 10,),
                    Text('The Model is wearing size S',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                    SizedBox(height: 10,),
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