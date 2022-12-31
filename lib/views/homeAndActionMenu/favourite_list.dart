import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/homeAndActionMenu/home_screen.dart';

class FavouriteListScreen extends StatelessWidget {
  const FavouriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Fvaourite List',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true, // You won't see infinite size error
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.02 * screenHeight,
                ),
                itemBuilder: ((context, index) => const ProductListTile()),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
