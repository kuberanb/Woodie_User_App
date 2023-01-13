import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class SelectedProductFullScreen extends StatelessWidget {
  const SelectedProductFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Double Bed',
          style: TextStyle(color: kWhiteColor),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.03 * screenWidth,
            left: 0.03 * screenWidth,
            top: 0.01 * screenHeight,
            // bottom: 0.01 * screenHeight,
          ),
          child: Column(
            children: [
              const ProductFullScreenImages(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Century Double Bed',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kWhiteColor,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.star_rounded,
                    color: kLightGreyColor,
                  ),
                  Text(
                    '4.8 (6,578 review)',
                    style: TextStyle(color: kLightWhiteColor),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Description',
                    style: TextStyle(color: kWhiteColor, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Text(
                '''Lorem ipsum dolor sit amet.consectur adipiscing elit, sed
do eiusmod tempor inciddunt ut labore at bkk from
hbjdjno ldm asjkhas nlnsal jnlnsal jlnoiw anoianoa  
andoiawa jkhksajnsa ,nndlan kbdskjbs jnlnasodn kbjk   mn jk l''',
                style: TextStyle(
                  color: kExtraLightWhiteColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Quantity',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 0.05 * screenWidth,
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
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const Divider(
                color: kLightGreyColor,
                thickness: 1,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 14,
                          color: kExtraLightWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 0.005 * screenHeight,
                      ),
                      const Text(
                        '₹ 25,000',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 0.6 * screenWidth,
                      height: 0.05 * screenHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: kBlackColor,
                            ),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductFullScreenImages extends StatelessWidget {
  const ProductFullScreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 0.42 * screenHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => const ProductFullScreenSingleImage()),
        itemCount: 4,
      ),
    );
  }
}

class ProductFullScreenSingleImage extends StatelessWidget {
  const ProductFullScreenSingleImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        right: 0.01 * screenWidth,
        left: 0.01 * screenWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 0.9 * screenWidth,
            height: 0.4 * screenHeight,
            decoration: BoxDecoration(
              color: kListTileColor,
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  'https://www.ulcdn.net/images/products/149916/slide/666x363/0.jpg?1548906914',
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // const Text(
          //   'Form Cushioned Sofa',
          //   style: TextStyle(
          //       color: kWhiteColor,
          //       fontSize: 18,
          //       overflow: TextOverflow.ellipsis),
          // ),
          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: 0.05 * screenWidth,
          //     ),
          //     const Text(
          //       '₹ 25,000',
          //       style: TextStyle(
          //         color: kLightWhiteColor,
          //         fontSize: 16,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
