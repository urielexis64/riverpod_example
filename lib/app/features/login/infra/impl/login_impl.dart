import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/domain/repo/login_repo_gateway.dart';

class LoginImpl implements LoginRepositoryGateway {
  LoginImpl._();

  static final LoginImpl instance = LoginImpl._();

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
