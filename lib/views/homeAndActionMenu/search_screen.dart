import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/searchScreenController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/homeAndActionMenu/home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(SearchScreenController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.searchController,
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kPrefixIconColor,
                    ),
                    suffixIcon: const Icon(
                      Icons.filter,
                      color: kPrefixIconColor,
                    ),
                    hintStyle: const TextStyle(color: kPrefixIconColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 0.05 * screenWidth,
                  left: 0.05 * screenWidth,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '''Results for "xyz"''',
                      style: TextStyle(
                        color: kPrefixIconColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '100 founds',
                      style: TextStyle(
                        color: kPrefixIconColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
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
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
