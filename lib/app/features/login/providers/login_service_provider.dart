import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/features/login/infra/impl/login_impl.dart';
import 'package:riverpod_examplee/app/features/login/infra/service/login_service.dart';

part 'login_service_provider.g.dart';

/// Provides a singleton instance of LoginService using LoginImpl as its gateway.
@riverpod
LoginService loginService(Ref _) => LoginService(LoginImpl.instance);
