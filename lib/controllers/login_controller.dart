// import 'package:flutter/cupertino.dart';

// class LoginController  {
//   TextEditingController phoneController = TextEditingController();

//   @override
//   void onClose() {
//     phoneController.dispose();
//     super.onClose();
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
   TextEditingController phoneController = TextEditingController();

  Future<bool> login() async {
    final response = await http.post(
      Uri.parse('https://shopers-v2-be.vercel.app/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phoneController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        return true;
      }
    }
    return false;
  }
  
  void onClose() {
    phoneController.dispose();
  }
}
