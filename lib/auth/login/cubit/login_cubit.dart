import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void changeTab(int tab) {
    emit(state.copyWith(
      userType: tab,
    ));
  }

  void toggleObscure() {
    emit(state.copyWith(
      isObscure: !state.isObscure,
    ));
  }
}
