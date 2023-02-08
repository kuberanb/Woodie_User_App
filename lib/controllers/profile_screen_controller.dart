import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';

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
    errorSnackBar('Selected Image is Uploading', context);
    final path = 'images/${imageXfile!.name}';
    final file = File(imageXfile!.path);

    final ref =
        FirebaseStorage.instance.ref().child('profilePictures').child(path);

    uploadTask = ref.putFile(file);

    final snapShot = await uploadTask!.whenComplete(() {});
    imageUrl = await snapShot.ref.getDownloadURL();
    log(imageUrl.toString());

    errorSnackBar('Image Uploaded Sucessfully ', context);
    log('Image Uploaded Sucessfully');
  }

  uploadImgUrlToFirebaseFirestore(context) async {
    if (imageUrl == null) {
      return;
    }

    try {
     errorSnackBar('Fetching the Uploaded Image...', context);
      await FirebaseFirestore.instance
          .collection(imageCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(imageList)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });

      await FirebaseFirestore.instance
          .collection(imageCollection)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(imageList)
          .add({"profileImageUrl": imageUrl});

      log('Uploaded to FirebaseFirestore');
    } catch (e) {
      errorSnackBar(e.toString(), context);
    }
  }

  //Stream<List<ProfilePictureModel>>

  Stream<QuerySnapshot<Map<String, dynamic>>> getProfilePicture() {
    return FirebaseFirestore.instance
        .collection(imageCollection)
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection(imageList)
        .snapshots();

    // .snapshots()
    // .map((snapshot) => snapshot.docs
    //     .map((doc) => ProfilePictureModel.fromJson(doc.data()))
    //     .toList());
  }
}
