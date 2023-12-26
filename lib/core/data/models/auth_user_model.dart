import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class AuthUserModel {
  final String? token;
  final int? expiresIn;
  final String? userId;
  final String? email;

  const AuthUserModel({
    this.token,
    this.expiresIn,
    this.userId,
    this.email,
  });

  @override
  String toString() {
    return 'AuthUserModel(token: $token, expiresIn: $expiresIn, userId: $userId, email: $email)';
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> data) => AuthUserModel(
        token: data['token'] as String?,
        expiresIn: data['expiresIn'] as int?,
        userId: data['userId'] as String?,
        email: data['email'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'expiresIn': expiresIn,
        'userId': userId,
        'email': email,
      };

  factory AuthUserModel.fromJson(String data) {
    return AuthUserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AuthUserModel) return false;
    return userId == other.userId;
  }

  @override
  int get hashCode => userId.hashCode;
}
