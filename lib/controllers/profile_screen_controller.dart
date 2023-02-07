import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/profile_image_model.dart';

class ProfileScreenController extends GetxController {
  final picker = ImagePicker();
  UploadTask? uploadTask;
  XFile? imageXfile;
  String? imageUrl;

  openGallery(context) async {
    imageXfile = await picker.pickImage(source: ImageSource.gallery);

    if (imageXfile == null) {
      errorSnackBar('Image is not Selected, Select Again', context);
    }

    if (imageXfile == null) {
      return;
    }
    errorSnackBar('Image Selected Sucessfully', context);
  }

  uploadImagesToFirebase(context) async {
    if (imageXfile == null) {
      return;
    }
    final path = 'images/${imageXfile!.name}';
    final file = File(imageXfile!.path);

    final ref =
        FirebaseStorage.instance.ref().child('profilePictures').child(path);

    uploadTask = ref.putFile(file);

    final snapShot = await uploadTask!.whenComplete(() {});
    imageUrl = await snapShot.ref.getDownloadURL();
    log(imageUrl.toString());

    errorSnackBar('Image Uploaded Sucessfully ', context);
  }

  uploadImgUrlToFirebaseFirestore(context) async {
    if (imageUrl == null) {
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection(imageCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({"profileImageUrl": imageUrl});
      log('Uploaded to FirebaseFirestore');
    } catch (e) {
      errorSnackBar(e.toString(), context);
    }
  }

  Stream<List<ProfilePictureModel>> getProfilePicture() {
    return FirebaseFirestore.instance
        .collection(imageCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProfilePictureModel.fromJson(doc.data()))
            .toList());
  }
}
