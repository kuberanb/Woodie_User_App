import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/homeAndActionMenu/search_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_category_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_product_fullscreen.dart';
import 'package:woodie/views/homeAndActionMenu/special_offers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 0.1 * screenWidth,
                    backgroundImage:
                        const AssetImage('assets/images/human_face_avatar.png'),
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      'Good Morining ',
                      style: TextStyle(color: kspecialGrey, fontSize: 16),
                    ),
                  ),
                  subtitle: const Text(
                    'Andrew Ainsley',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    height: 0.1 * screenHeight,
                    width: 0.22 * screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.notifications_active_outlined,
                            color: kspecialGrey,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 0.005 * screenWidth,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_outline_outlined,
                            color: kspecialGrey,
                            size: 30,
                          ),
                        ),
                        // SizedBox(
                        //   width: 0.005 * screenWidth,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const SearchScreen()),
                            ),
                          );
                        },
                        child: Container(
                          // color: kListTileColor,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kListTileColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '   Search',
                                style: TextStyle(
                                    color: kspecialGrey, fontSize: 22),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const SearchScreen()),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: kspecialGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Special Offers',
                            style: TextStyle(color: kWhiteColor, fontSize: 20),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const SpecialOffersScreen()),
                                ),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpecialOffer(),
                      SizedBox(
                        height: 0.03 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryIcons(
                            iconName: 'Sofa',
                            iconUrl: 'assets/images/sofa_icon.png',
                            pressedFunc: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const SelectedCategoryScreen())));
                            },
                          ),
                          CategoryIcons(
                            iconName: 'Chair',
                            iconUrl: 'assets/images/office_chair.png',
                            pressedFunc: () {},
                          ),
                          CategoryIcons(
                            iconName: 'Table',
                            iconUrl: 'assets/images/table_icon.png',
                            pressedFunc: () {},
                          ),
                          CategoryIcons(
                            iconName: 'Kitchen',
                            iconUrl: 'assets/images/fridge_icon.png',
                            pressedFunc: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.03 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryIcons(
                            iconName: 'Lamp',
                            iconUrl: 'assets/images/lamp_icon.png',
                            pressedFunc: () {},
                          ),
                          CategoryIcons(
                            iconName: 'Cupboard',
                            iconUrl: 'assets/images/cupboard_icon.png',
                            pressedFunc: () {},
                          ),
                          CategoryIcons(
                            iconName: 'Vase',
                            iconUrl: 'assets/images/vase_icon.png',
                            pressedFunc: () {},
                          ),
                          CategoryIcons(
                            iconName: 'Others',
                            iconUrl: 'assets/images/others_icon.png',
                            pressedFunc: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.03 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Most Popular',
                            style: TextStyle(color: kWhiteColor, fontSize: 20),
                          ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text(
                          //     'See All',
                          //     style: TextStyle(
                          //       color: kWhiteColor,
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 0.03 * screenHeight,
                      // ),
                      // // const CategorySelectionSingleItem(),
                      // const ProductListTile(),
                      SizedBox(
                        height: 0.05 * screenHeight,
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true, // You won't see infinite size error
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.02 * screenHeight,
                  ),
                  itemBuilder: ((context, index) => const ProductListTile()),
                  itemCount: 6,
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
                right: 0.01 * screenWidth, left: 0.01 * screenWidth),
            child: Column(
              children: [
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                const Text(
                  '25%',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                const Text(
                  "Today's Special ",
                  style: TextStyle(
                      color: kLightWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                const Text(
                  ''' Get discount for every 
order. only valid for today''',
                  style: TextStyle(color: kGreyColor, fontSize: 16),
                ),
              ],
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
                  width: 0.35 * screenWidth,
                  child: Image.asset(
                    'assets/images/images2.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  String iconName;
  String iconUrl;
  VoidCallback pressedFunc;
  CategoryIcons(
      {super.key,
      required this.iconName,
      required this.iconUrl,
      required this.pressedFunc});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: pressedFunc,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(40),
              color: kWhiteColor,
              border: Border.all(
                color: kLightGreyColor,
                width: 0.03 * screenWidth,
              ),
            ),
            // height: 0.15 * screenWidth,
            // width: 0.15 * screenWidth,
            // color: kListTileColor,

            child: Image.asset(
              iconUrl,
              fit: BoxFit.fill,
              width: 0.08 * screenWidth,
              height: 0.08 * screenWidth,
            ),
          ),
          SizedBox(
            height: 0.01 * screenHeight,
          ),
          Text(
            iconName,
            style: const TextStyle(color: kWhiteColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// class CategorySelectionTabItems extends StatelessWidget {
//   const CategorySelectionTabItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container();
//   }
// }

// class CategorySelectionSingleItem extends StatelessWidget {
//   const CategorySelectionSingleItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       width: 0.05 * screenWidth,
//       height: 0.001 * screenHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Text(
//         'Sofa',
//         style: TextStyle(color: kWhiteColor, fontSize: 14),
//       ),
//     );
//   }
// }

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SelectedProductFullScreen())));
      },
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
                        'https://www.ulcdn.net/images/products/162605/slide/666x363/Carven_Lounge_Chair_Grey_1.jpg?1514963528',
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
              'Form Padded Chair',
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
                  '₹ 9,000',
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
