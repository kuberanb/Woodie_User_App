import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/address_model.dart';
import 'package:woodie/models/cart_model.dart';
import 'package:woodie/models/order_model.dart';
import 'package:woodie/models/user_model.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/order_sucess_screen.dart';

class PaymentsMethodsScreen extends StatefulWidget {
  PaymentsMethodsScreen(
      {super.key,
      required this.address,
      required this.cartProductsList,
      required this.totalAmount});

  final AddressModel address;
  final List<CartModel> cartProductsList;
  int totalAmount;

  @override
  State<PaymentsMethodsScreen> createState() => _PaymentsMethodsScreenState();
}

class _PaymentsMethodsScreenState extends State<PaymentsMethodsScreen> {
  int _value = 0;

  //static const platform = const MethodChannel("razorpay_flutter");

  Razorpay? _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay!.clear();
  }

  void razorPayCheckout() async {
    var options = {
      'key': '<YOUR_KEY_HERE>',
      'amount': (widget.totalAmount) * 100,
      'name': widget.address.fullName,
      'description': 'Woodie Purchase',
      'prefill': {
        'contact': widget.address.fullName,
        'email': FirebaseAuth.instance.currentUser!.email,
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      errorSnackBar(e.toString(), context);
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment Sucess');
  }

  _handlePaymentError() {
    log('Payment Error');
  }

  _handleExternalWallet() {
    log('Payment to External Wallet');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        title: const Text(
          'Payments Methods',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.03 * screenWidth,
            left: 0.03 * screenWidth,
          ),
          child: SizedBox(
            height: 0.9 * screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select the Payment Method you want to use.',
                    style: TextStyle(
                      color: kPrefixIconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  tileColor: kListTileColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Text(
                    '  R',
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: const Text(
                    'RazorPay',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Radio(
                      value: 0,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kWhiteColor),
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  tileColor: kListTileColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Text(
                    '  C',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {},
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           //borderRadius: BorderRadius.circular(40),
                  //           color: kWhiteColor,
                  //           border: Border.all(
                  //             color: kBlackColor,
                  //             width: 0.015 * screenWidth,
                  //           ),
                  //         ),
                  //         // height: 0.15 * screenWidth,
                  //         // width: 0.15 * screenWidth,
                  //         // color: kListTileColor,

                  //         child: Image.asset(
                  //           'assets/images/google_icon.png',
                  //           fit: BoxFit.fill,
                  //           width: 0.08 * screenWidth,
                  //           height: 0.08 * screenWidth,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  title: const Text(
                    'Cash On Delivery',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kWhiteColor),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                AmountRows(
                  amount: widget.totalAmount,
                  text: 'Order Value',
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                AmountRows(
                  text: 'Delivery',
                  amount: 0,
                ),
                // SizedBox(
                //   height: 0.02 * screenHeight,
                // ),
                const Divider(
                  color: kLightWhiteColor,
                  thickness: 1,
                ),
                AmountRows(
                  amount: widget.totalAmount,
                  text: 'Total',
                ),
                // const Divider(color: kWhiteColor,thickness: 0.5,),
                // const Divider(color: kWhiteColor,thickness: 0.5,),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    log(widget.address.city.toString());
                    if (_value == 0) {
                      razorPayCheckout();
                      log('Razor pay Selected');
                    } else if (_value == 1) {
                      log('Cash On Delivery Selected');
                      // String orderId =
                      //     DateTime.now().millisecondsSinceEpoch.toString();

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: ((context) => const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: kWhiteColor,
                              ),
                            )),
                      );

                      try {
                        for (var product in widget.cartProductsList) {
                          String orderId =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          await FirebaseFirestore.instance
                              .collection(orders)
                              .doc(orderId)
                              .set(
                                OrderModel(
                                        orderId: orderId,
                                        productName: product.productName,
                                        imageUrl: product.productImage,
                                        price: product.productPrice,
                                        cartCount: product.productQuantity,
                                        payment: cashOnDelivery,
                                        userEmail: email!,
                                        address: '''${widget.address.hName}   
                                            ${widget.address.city}  
                                            ${widget.address.state}''')
                                    .toJson(),
                              );
                        }

                        for (var cartItem in widget.cartProductsList) {
                          await FirebaseFirestore.instance
                              .collection(cartCollection)
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection(userCartCollection)
                              .doc(cartItem.productName + 2.toString())
                              .delete();
                        }
                        Navigator.of(context).pop();

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: ((context) => const OrderSucessScreen()),
                            ),
                            (Route<dynamic> route) => false);

                            
                      } catch (e) {
                        Navigator.of(context).pop();
                        errorSnackBar(e.toString(), context);
                      }
                    }
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screenWidth,
                      height: 0.06 * screenHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhiteColor,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Place Order',
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AmountRows extends StatelessWidget {
  String text;
  int amount;
  AmountRows({
    super.key,
    required this.text,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '₹ $amount',
          style: const TextStyle(color: kWhiteColor, fontSize: 18),
        ),
      ],
    );
  }
}
