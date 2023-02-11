import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/models/order_model.dart';

class OrderController extends GetxController {
  Stream<List<OrderModel>> getAllOrders() {
    return FirebaseFirestore.instance.collection(orders).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (e) => OrderModel.fromJson(e.data()),
              )
              .toList(),
        );
  }
}
