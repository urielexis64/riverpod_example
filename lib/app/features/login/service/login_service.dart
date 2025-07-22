import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/domain/repo/login_repo.dart';

/// Contains business logic for login, using [LoginRepository].
class LoginService implements LoginRepository {
  LoginService._();

  static final LoginService instance = LoginService._();

  @override
  Future<User?> login(String email, String password) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 1));

    // Check credentials
    if (email == 'test@test.com' && password == 'password') {
      return User(id: '1', email: email);
    }

    return null;
  }
}
