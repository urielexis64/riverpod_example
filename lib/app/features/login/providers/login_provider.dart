import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';
import 'package:riverpod_examplee/app/features/login/infra/service/login_service.dart';
import 'package:riverpod_examplee/app/features/login/providers/login_service_prov.dart';

part 'login_provider.g.dart';

// Only expose the provider instead of the class.
// This way, we can control access to the provider and give it a name
// that makes sense to the rest of the app.
final loginProvider = _loginProviderProvider;

// This class can be named "Login" or anything else, what is important is
// that it must be private.
@riverpod
class _LoginProvider extends _$LoginProvider {
  late final LoginService _service;

  @override
  FutureOr<User?> build() async {
    _service = ref.read(loginServiceProvProvider);
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
