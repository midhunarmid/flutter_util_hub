import 'package:flutter_util_hub/core/data/models/auth_user_model.dart';
import 'package:flutter_util_hub/core/domain/repositories/user_repository.dart';

class AuthenticationUseCase {
  final UserRepository _userRepository;

  AuthenticationUseCase(this._userRepository);

  Future<AuthUserModel> authenticateUser(String email, String password) async {
    return await _userRepository.authenticateUser(email, password);
  }
}
