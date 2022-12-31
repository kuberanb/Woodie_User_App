import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class SelectedCategoryScreen extends StatelessWidget {
  const SelectedCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Sofa',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
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
                itemBuilder: ((context, index) =>
                    const SelectedCategoryScreenItem()),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedCategoryScreenItem extends StatelessWidget {
  const SelectedCategoryScreenItem({super.key});

  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 0.4 * screenWidth,
        height: 0.24 * screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 0.4 * screenWidth,
                  height: 0.15 * screenHeight,
                  decoration: BoxDecoration(
                    color: kListTileColor,
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                        'https://www.ulcdn.net/images/products/558836/original/FNSF51PIDG3_-_main_1.jpg?1653561352',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            const Text(
              'Form Cushioned Sofa',
              style: TextStyle( 
                  color: kWhiteColor,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.05 * screenWidth,
                ),
                const Text(
                  '₹ 25,000', 
                  style: TextStyle(
                    color: kLightWhiteColor,
                    fontSize: 16,
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
