import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUPCubit extends Cubit<SignUpState> {
  SignUPCubit() : super(const SignUpState());

  void changeTab(int tab) {
    emit(state.copyWith(
      userType: tab,
    ));
  }

  void startOtpTimer() {
    Future<void>.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(
        otpTimer: state.otpTimer - 1,
      ));
      if (state.otpTimer > 0) {
        startOtpTimer();
      }
    });
  }

  void validateOtpLength(String otp) {
    emit(state.copyWith(
      isOtpLengthValid: otp.length == 6,
    ));
  }

  void togglePasswordObscure() {
    emit(state.copyWith(
      isPasswordObscure: !state.isPasswordObscure,
    ));
  }

  void toggleReEnterPasswordObscure() {
    emit(state.copyWith(
      isReEnterPasswordObscure: !state.isReEnterPasswordObscure,
    ));
  }
}
