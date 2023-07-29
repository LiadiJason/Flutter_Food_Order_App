import 'package:flutter/material.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void paymentGateway() {
    var options = {
      'key': 'rzp_test_vGK6MGNzKLOrew',
      'amount': num.parse(textEditingController.text) * 100,
      'currency': 'USD',
      'name': 'D-Meli Cafeteria',
      'description': 'Payment for order',
      'prefill': {'contact': '0123456789', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void paymentSuccess() {
    print('Payment successful');
    Toast.show('Payment successful', context);
  }

  void paymentError() {
    print('Payment error');
    Toast.show('Payment unsuccessful', context);
  }

  void externalWallet() {
    print('External wallet');
    Toast.show('External wallet', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: 'Enter amount'),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              color: blue,
              child: Text(
                'Continue to payment',
                style: TextStyle(color: white),
              ),
              onPressed: () {
                paymentGateway();
              },
            )
          ],
        ),
      ),
    );
  }
}
