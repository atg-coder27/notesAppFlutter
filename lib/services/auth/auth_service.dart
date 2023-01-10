import 'package:notesapp/services/auth/auth_user.dart';
import 'package:notesapp/services/auth/auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService(this.provider);

  @override
  Future<AuthUser> createUser(
      {required String email, required String password}) {
    provider.createUser(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> login({required String email, required String password}) {
    provider.login(email: email, password: password);
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    provider.logout();
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    provider.sendEmailVerification();
    throw UnimplementedError();
  }
}
