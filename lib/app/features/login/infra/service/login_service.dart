import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/domain/repo/login_repo_gateway.dart';

/// Contains business logic for login, using [LoginRepository].
class LoginService {
  final LoginRepositoryGateway _loginRepositoryGateway;

  LoginService({required LoginRepositoryGateway loginRepositoryGateway})
    : _loginRepositoryGateway = loginRepositoryGateway;

  Future<User?> login(String email, String password) async {
    return _loginRepositoryGateway.login(email, password);
  }
}
