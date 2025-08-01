import 'package:riverpod_examplee/app/features/login/domain/model/user.dart';

/// Defines the contract for login-related operations.
abstract class LoginGateway {
  Future<User?> login(String email, String password);
}


/**
 * repo rename to gateway
 * pages to root folder
 * providers subfix for providers exports 
 */