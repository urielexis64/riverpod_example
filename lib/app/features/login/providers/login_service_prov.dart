import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/features/login/infra/impl/login_impl.dart';
import 'package:riverpod_examplee/app/features/login/infra/service/login_service.dart';

part 'login_service_prov.g.dart';

// Only expose the provider instead of the class.
// This way, we can control access to the provider and give it a name
// that makes sense to the rest of the app.
final loginServiceProvider = _loginServiceProvProvider;

/// Provides a singleton instance of LoginService using LoginImpl as its gateway.
@riverpod
LoginService _loginServiceProv(Ref _) => LoginService(LoginImpl.instance);
