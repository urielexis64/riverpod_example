import 'package:riverpod_examplee/app/features/login/domain/repo/login_repo_gateway.dart';
import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';

class LoginImpl implements LoginRepositoryGateway {
  LoginImpl._();

  static final LoginImpl instance = LoginImpl._();

  @override
  Future<User?> login(String email, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
