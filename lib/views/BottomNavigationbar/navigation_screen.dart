import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:woodie/controllers/navigationscreenController.dart';
import 'package:woodie/core/colorPalettes.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationScreenController());
    return Scaffold(
      body: Obx(
        (() => IndexedStack(
            index: controller.pageIndex.value, children: controller.pages)),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: ((value) {
            // controller.selectedValue = RxInt(value);
            controller.changeIndex(value);
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBackgroundColor,
          selectedItemColor: kWhiteColor,
          unselectedItemColor: kBottomNavigationIconColor,
          currentIndex: controller.pageIndex.value,
          items: controller.bottomNavigationBarItemList,
        ),
      ),
    );
  }
}
