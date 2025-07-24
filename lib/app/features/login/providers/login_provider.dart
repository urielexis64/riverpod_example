import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/infra/impl/login_impl.dart';
import 'package:riverpod_examplee/app/features/login/infra/service/login_service.dart';

part 'login_provider.g.dart';

final loginProviderAux = Provider<LoginService>((ref) {
  return LoginService(loginRepositoryGateway: LoginImpl.instance);
});

@riverpod
class Login extends _$Login {
  final _service = ref.watch(loginProviderAux);

  @override
  FutureOr<User?> build() async {
    // Here we can load the user from storage or any other source.
    // As example, we start with no user.
    return null;
  }

  Future<void> login(String email, String password) async {
    // Set the loading state.
    state = const AsyncLoading();

    final user = await _service.login(email, password);

    // If login succeeds, we can set the user.
    if (user != null) {
      state = AsyncData(user);
    } else {
      // If login fails, we can set an error state.
      state = const AsyncError('Invalid credentials', StackTrace.empty);
    }
  }
}
