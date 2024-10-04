import 'dart:async';
import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:flutter/foundation.dart';
import 'package:general_repository/general_repository.dart';

class LogInFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  LogInFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
    GeneralRepository? generalRepository,
  })  : _cache = cache ?? CacheClient(),
        _generalRepository = generalRepository ?? GeneralRepository();

  final CacheClient _cache;
  final GeneralRepository _generalRepository;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  @visibleForTesting
  final StreamController<UserAuthentication> userAuth =
      StreamController<UserAuthentication>();

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<UserAuthentication> get user async* {
    var userJson = _cache.read<String>(key: userCacheKey);
    yield userJson == null
        ? UserAuthentication.empty
        : UserAuthentication.fromJson(jsonDecode(userJson));
    yield* userAuth.stream.map((user) {
      _cache.write<String>(
        key: userCacheKey,
        value: jsonEncode(user.toJson()),
      );
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  UserAuthentication get currentUser {
    var userJson = _cache.read<String>(key: userCacheKey);
    return userJson == null
        ? UserAuthentication.empty
        : UserAuthentication.fromJson(jsonDecode(userJson));
  }

  /// Starts the Sign In Flow.
  ///
  /// Throws a [LogInFailure] if an exception occurs.
  Future<void> login(String email, String password) async {
    String encodedBody = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      var responseJson = await _generalRepository.post(
        handle: "auth/login",
        header: <String, String>{
          "Content-Type": "application/json",
          "Content-Length": encodedBody.length.toString(),
        },
        body: encodedBody,
      );

      userAuth.add(UserAuthentication.fromJson(responseJson));
    } catch (e) {
      throw LogInFailure(e.toString());
    }
  }

  Future<void> refresh() async {
    String encodedBody = jsonEncode({"refresh": currentUser.refresh});
    final header = <String, String>{
      "Content-Type": "application/json",
      "Content-Length": encodedBody.length.toString(),
    };

    try {
      var responseJson = await _generalRepository.post(
        handle: 'auth/refresh',
        header: header,
        body: encodedBody,
      );

      final user = UserAuthentication.fromJson(responseJson);

      _cache.write<String>(
        key: userCacheKey,
        value: jsonEncode(user.toJson()),
      );
    } catch (e) {
      userAuth.add(UserAuthentication.empty);
      throw LogInFailure(e.toString());
    }
  }

  Future<void> register(
      String businessName,
      String password,
      String confirmPassword,
      String email,
      String firstName,
      String lastName) async {
    String encodedBody = jsonEncode({
      "business_name": businessName,
      "password": password,
      "confirm_password": confirmPassword,
      "email": email,
      "first_name": firstName,
      "last_name": lastName
    });

    try {
      await _generalRepository
          .post(
            handle: 'auth/register',
            header: <String, String>{
              'Content-Type': "application/json",
              'Content-Length': encodedBody.length.toString(),
            },
            body: encodedBody,
          )
          .then(
            (_) => login(email, password),
          );
    } catch (e) {
      throw LogInFailure(e.toString());
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logout() async {
    try {
      userAuth.add(UserAuthentication.empty);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// disposes the userAuth stream
  void dispose() => userAuth.close();
}
