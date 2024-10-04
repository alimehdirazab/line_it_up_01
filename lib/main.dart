import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:general_repository/general_repository.dart';
import 'package:line_it_up/app/app.dart';
import 'package:line_it_up/utils/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await CacheClient.initializeCache();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey =
      'pk_test_51Q2XvNRpZrmvYx0CM3Aa3giBEOBiGleR7PDlQdQ0Ugwc82qXZxYEux0fE64BgaJhxGWiSh8QXTqJBS5bKsKCzNm400oW7ozglN';

  // If needed, you can also initialize the PaymentConfiguration
  Stripe.instance.applySettings();

  ApiConfig.baseUrl = LineItUpApis.baseUrl;

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}
