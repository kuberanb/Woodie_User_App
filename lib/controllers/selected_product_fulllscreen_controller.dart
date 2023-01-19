import 'package:get/get.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';

class SelectedProductFullScreenController extends GetxController {
  int productQuantity = 1;
  int totalPrice = 0;

   increaseProductQuantity(context) {
    if ((productQuantity == 1 || productQuantity > 1)) {
      productQuantity++;
      update();
    } else {
      errorSnackBar('Some Error Occured', context);
      update();
    }
  }

   decreaseProductQuantity(context) {
    if (productQuantity >= 2) {
      productQuantity--;
      update();
    } else {
      errorSnackBar('product Quantity cannot be reduced less than 1', context);
      update();
    }
  }

   productTotalPrice(int productPrice) {
    int tempTotalPrice = 0;
    totalPrice = 0;
    tempTotalPrice = productQuantity * productPrice;
    totalPrice = totalPrice + tempTotalPrice;
    tempTotalPrice =0;
    update();
  }
}
