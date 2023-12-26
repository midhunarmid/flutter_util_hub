import 'dart:math';

import 'package:flutter_util_hub/core/data/models/auth_user_model.dart';
import 'package:flutter_util_hub/core/presentation/utils/message_generator.dart';
import 'package:flutter_util_hub/core/presentation/utils/my_app_exception.dart';

class RemoteDataSource {
  Future<AuthUserModel> authenticateUser(String email, String password) async {
    // Simulated API call or data retrieval logic
    // Replace this with your actual API integration logic

    // Simulating a response from a remote API
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating delay for API call

    // Mock response data (replace with your actual API response parsing)
    final Map<String, dynamic> userJson = {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
      "expiresIn": 3600,
      "userId": "123456",
      "email": "user@example.com"
    };

    // throw auth exception randomly for testing purpose
    if (Random().nextBool()) {
      throw MyAppException(
          title: MessageGenerator.getMessage("Auth Error"),
          message: MessageGenerator.getMessage("Invalid credentials"));
    }

    // Convert JSON data to UserModel instance
    return AuthUserModel.fromMap(userJson);
  }
}
