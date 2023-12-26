import 'package:flutter_util_hub/core/data/models/auth_user_model.dart';

abstract class UserRepository {
  Future<AuthUserModel> authenticateUser(String email, String password);
}
