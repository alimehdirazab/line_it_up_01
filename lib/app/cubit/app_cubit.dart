import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.authenticationRepository, {
    CacheClient? cache,
  })  : cache = cache ?? CacheClient(),
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser,
                  const Locale('en'), true)
              : const AppState.unauthenticated(Locale('en'), true),
        ) {
    userSubscription = authenticationRepository.user.listen(
      (user) => changeAppState(user),
    );
  }

  final AuthenticationRepository authenticationRepository;
  late final StreamSubscription<UserAuthentication> userSubscription;
  final CacheClient cache;

  void changeAppState(UserAuthentication user) {
    emit(
      user.isNotEmpty
          ? AppState.authenticated(user, state.locale!, state.showOnboarding!)
          : AppState.unauthenticated(state.locale!, state.showOnboarding!),
    );
  }

  void logout() {
    unawaited(authenticationRepository.logout());
  }

  void initializeApp() {
    final locale = cache.read<String>(key: LineItUpCaches.localeCacheKey);
    final showOnboarding =
        cache.read<bool>(key: LineItUpCaches.onboardingCacheKey);
    emit(state.copyWith(
      locale: locale == null ? const Locale('en') : Locale(locale),
      showOnboarding: showOnboarding ?? true,
    ));
  }

  void selectEnglishLocale() {
    emit(state.copyWith(locale: const Locale('en')));
    cache.write(key: LineItUpCaches.localeCacheKey, value: 'en');
  }

  void disableOnboarding() {
    emit(state.copyWith(showOnboarding: false));
    cache.write(key: LineItUpCaches.onboardingCacheKey, value: false);
  }

  @override
  Future<void> close() {
    userSubscription.cancel();
    authenticationRepository.dispose();
    return super.close();
  }
}
