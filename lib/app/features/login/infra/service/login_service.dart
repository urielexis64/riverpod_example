import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/domain/gateway/login_repo_gateway.dart';

/// Contains business logic for login, using [LoginRepository].
class LoginService {
  LoginService(this._loginRepositoryGateway);

  final LoginGateway _loginRepositoryGateway;

  Future<User?> login(String email, String password) async {
    return _loginRepositoryGateway.login(email, password);
  }
}
