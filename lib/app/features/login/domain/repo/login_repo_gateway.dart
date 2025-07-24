import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';

/// Defines the contract for login-related operations.
abstract class LoginRepositoryGateway {
  Future<User?> login(String email, String password);
}
