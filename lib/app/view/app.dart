import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_repository/general_repository.dart';
import 'package:line_it_up/app/cubit/app_cubit.dart';
import 'package:line_it_up/onboarding/view/view.dart';
import 'package:localization/localization.dart';
import '../../utils/utils.dart';
import '../app.dart';

class App extends StatelessWidget {
  const App({super.key, required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider(
          create: (context) => GeneralRepository(
              authenticationRepository: authenticationRepository),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppCubit(authenticationRepository)..initializeApp(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.select((AppCubit cubit) => cubit.state);
    LineItUpTheme lineItUpTheme = LineItUpTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Line It Up",
      theme: lineItUpTheme.data,
      locale: appState.locale,
      supportedLocales: LocalizationSetup.supportedLocales,
      localizationsDelegates: LocalizationSetup.localizationsDelegates,
      localeResolutionCallback: LocalizationSetup.localeResolutionCallback,
      home: _buildPages(),
    );
  }

  Widget _buildPages() {
    return const OnboardingPage();
  }
}
