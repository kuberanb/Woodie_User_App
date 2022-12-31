import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class SpecialOffersScreen extends StatelessWidget {
  const SpecialOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Special Offers',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.03 * screenWidth,
            left: 0.03 * screenWidth,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              SpecialOffersSingleItem(
                percentageValue: '25%',
                titleText: "Today's Special!",
                descriptionText: '''Get discount for every 
order. Only valid for today ''',
                imageUrl:
                    'https://www.ulcdn.net/images/products/558836/original/FNSF51PIDG3_-_main_1.jpg?1653561352',
                onpressedFunction: () {},
              ),
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              SpecialOffersSingleItem(
                percentageValue: '15%',
                titleText: 'Weekend Deals',
                descriptionText: '''Get discount for every 
order. Only valid for today ''',
                imageUrl:
                    'https://ii1.pepperfry.com/media/catalog/product/a/v/800x880/avilys-solid-wood-writing-table-with-2-drawers-in-provincial-teak-finish-by-woodsworth-avilys-solid--ltlnuc.jpg',
                onpressedFunction: () {},
              ),
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              SpecialOffersSingleItem(
                percentageValue: '30%',
                titleText: 'New Arrivals',
                descriptionText: '''Get discount for every 
order. Only valid for today ''',
                imageUrl:
                    'https://ii1.pepperfry.com/media/catalog/product/a/v/800x880/avilys-solid-wood-coffee-table-in-provincial-teak-finish-by-woodsworth-avilys-solid-wood-coffee-tabl-wqosro.jpg',
                onpressedFunction: () {},
              ),
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              SpecialOffersSingleItem(
                percentageValue: '20%',
                titleText: 'Black Friday',
                descriptionText: '''Get discount for every 
order. Only valid for today ''',
                imageUrl:
                    'https://ii1.pepperfry.com/media/catalog/product/a/v/800x880/avilys-solid-wood-dining-chair--set-of-2--in-provincial-teak-finish-by-woodsworth-avilys-solid-wood--mzplcn.jpg',
                onpressedFunction: () {},
              ),
              SizedBox(
                height: 0.03 * screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialOffersSingleItem extends StatelessWidget {
  String percentageValue;
  String titleText;
  String descriptionText;
  String imageUrl;
  VoidCallback onpressedFunction;
  SpecialOffersSingleItem({
    super.key,
    required this.percentageValue,
    required this.titleText,
    required this.descriptionText,
    required this.imageUrl,
    required this.onpressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onpressedFunction,
      child: Container(
        height: 0.2 * screenHeight,
        width: double.infinity,
        // color: kListTileColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kListTileColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 0.01 * screenWidth,
                left: 0.01 * screenWidth,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 0.04 * screenWidth,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.03 * screenHeight,
                    ),
                    Text(
                      percentageValue,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Text(
                      titleText,
                      style: const TextStyle(
                        color: kLightWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                      width: 0.1 * screenWidth,
                    ),
                    Text(
                      descriptionText,
                      style: const TextStyle(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0.04 * screenWidth),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kListTileColor,
                    ),
                    height: 0.15 * screenHeight,
                    width: 0.25 * screenWidth,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
