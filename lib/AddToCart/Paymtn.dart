import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

    var amountController = TextEditingController();
    var _razorpay = Razorpay();

    @override
  void initState(){
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      // Do something when payment succeeds
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      // Do something when payment fails
    }

    void _handleExternalWallet(ExternalWalletResponse response) {
      // Do something when an external wallet is selected
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextField(
              controller: amountController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Amount',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                var options = {
                'key': "rzp_test_QrjoZd5gG0uVkb",
                'amount': (int.parse(amountController.text)*100).toString(),
                'name': 'Aditi Singh',
                'description': 'testing paisa',
                'timeout': 300, 
                'prefill': {
                  'contact': '9795677012',
                  'email': 'aditisinghrawal@gmail.com'
                }
              };
              _razorpay.open(options);
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set the green shade1
                padding: EdgeInsets.all(16.0), // Adjust padding as needed
              ),
              child: Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ]
      ),
      );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}