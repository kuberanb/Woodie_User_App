import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/address_model.dart';

class AddressFullScreen extends StatelessWidget {
  final AddressModel selectedAddress;
  const AddressFullScreen({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
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
          'Address Full Screen',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 0.02 * screenHeight,
            bottom: 0.02 * screenHeight,
            left: 0.05 * screenWidth,
            right: 0.05 * screenWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EachRowItem(
                value: selectedAddress.fullName,
                title: 'Full Name: ',
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              EachRowItem(title: 'House Name: ', value: selectedAddress.hName),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              EachRowItem(
                title: 'Road Name: ',
                value: selectedAddress.rName,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              EachRowItem(title: 'City Name: ', value: selectedAddress.city),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              EachRowItem(
                title: 'Pincode: ',
                value: selectedAddress.pincode.toString(),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              EachRowItem(title: 'State Name : ', value: selectedAddress.state),
            ],
          ),
        ),
      ),
    );
  }
}

class EachRowItem extends StatelessWidget {
  const EachRowItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: kLightWhiteColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
