import 'dart:math';
import 'dart:developer' as devtools;
import 'package:notesapp/services/auth/auth_exceptions.dart';
import 'package:notesapp/services/auth/auth_provider.dart';
import 'package:notesapp/services/auth/auth_user.dart';
import "package:test/test.dart";

void main() {
  group("Mock Authentiaction", () {
    final provider = MockAuthProvider();
    test('Should not be initialized to begin with ', () {
      expect(provider._isInitialized, false);
    });

    test('Cannot logout if not initialized ', () {
      expect(provider.logout(),
          throwsA(const TypeMatcher<NotInitializedException>()));
    });

    test('Should be able to initialize', () async {
      await provider.initialize();
      expect(provider._isInitialized, true);
    });

    test("User should be null after initialization", () {
      expect(provider._user, null);
    });

    test("Should be initialized in less than 2 seconds ", () async {
      await provider.initialize();
      expect(provider._isInitialized, true);
    }, timeout: const Timeout(Duration(seconds: 2)));

    test("Create user should delegate login", () async {
      final badUserEmail = provider.createUser(
          email: "foobar@gmail.com", password: "anypassword");
      expect(badUserEmail,
          throwsA(const TypeMatcher<UserNotLoggedInAuthException>()));

      final badUserPassword =
          provider.createUser(email: "any@email.com", password: "foobar");
      expect(badUserPassword,
          throwsA(const TypeMatcher<WrongPassAuthException>()));

      final user = await provider.createUser(email: "foo", password: "bar");
      expect(provider.currentUser, user);
      expect(user.isEmailVerified, false);
    });

    test("Login User should be able to verify", () {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    test("Should be able to login and logout again", () async {
      await provider.logout();
      await provider.login(email: "user", password: "password");
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialized = false;
  bool getIsInititlized() => _isInitialized;

  @override
  Future<AuthUser> createUser(
      {required String email, required String password}) async {
    if (!_isInitialized) throw NotInitializedException();

    await Future.delayed(const Duration(seconds: 1));
    return login(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    if (!_isInitialized) throw NotInitializedException();
    if (email == "foobar@gmail.com") throw UserNotLoggedInAuthException();
    if (password == "foobar") throw WrongPassAuthException();
    const user = AuthUser(isEmailVerified: false, email: "abc@gmail.com");
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logout() async {
    if (!_isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!_isInitialized) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotLoggedInAuthException();
    const newUser = AuthUser(isEmailVerified: true, email: "abc@gmail.com");
    _user = newUser;
  }
}
