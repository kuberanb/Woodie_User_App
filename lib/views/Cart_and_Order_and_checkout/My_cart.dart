import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class MyCartSingleItem extends StatelessWidget {
  const MyCartSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: kListTileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 0.25 * screenWidth,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lowson Chair',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: kPrefixIconColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 0.01 * screenWidth,
                    backgroundColor: kBlueColor,
                  ),
                  const Text(
                    'Blue Grey',
                    style: TextStyle(color: kspecialGrey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        '₹5000',
                        style: TextStyle(color: kWhiteColor, fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    width: 0.3 * screenWidth,
                    height: 0.05 * screenHeight,
                    decoration: BoxDecoration(
                      color: kListTileColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            color: kWhiteColor,
                          ),
                        ),
                        const Text(
                          '2',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
