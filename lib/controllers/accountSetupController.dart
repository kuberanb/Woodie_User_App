import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSetUpController extends GetxController {
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  String? selectedValue = '     Male';

  final genderItems = [
    const DropdownMenuItem(
      value: '     Male',
      child: Text('     Male'),
    ),
    const DropdownMenuItem(
      value: '     Female',
      child: Text('     Female'),
    ),
    const DropdownMenuItem(
      value: '     Transgender',
      child: Text('     Transgender'),
    ),
  ];
}
