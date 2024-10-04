part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.userType = 0,
    this.otpTimer = 60,
    this.isOtpLengthValid = false,
    this.isPasswordObscure = true,
    this.isReEnterPasswordObscure = true,
  });

  final int userType;
  final int otpTimer;
  final bool isOtpLengthValid;
  final bool isPasswordObscure;
  final bool isReEnterPasswordObscure;

  SignUpState copyWith(
          {int? userType,
          int? otpTimer,
          bool? isOtpLengthValid,
          bool? isPasswordObscure,
          bool? isReEnterPasswordObscure}) =>
      SignUpState(
        userType: userType ?? this.userType,
        otpTimer: otpTimer ?? this.otpTimer,
        isOtpLengthValid: isOtpLengthValid ?? this.isOtpLengthValid,
        isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
        isReEnterPasswordObscure:
            isReEnterPasswordObscure ?? this.isReEnterPasswordObscure,
      );

  @override
  List<Object> get props => [
        userType,
        otpTimer,
        isOtpLengthValid,
        isPasswordObscure,
        isReEnterPasswordObscure
      ];
}
