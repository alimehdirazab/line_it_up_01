part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({this.userType = 0, this.isObscure = true});

  final int userType;
  final bool isObscure;

  LoginState copyWith({int? userType, bool? isObscure}) => LoginState(
        userType: userType ?? this.userType,
        isObscure: isObscure ?? this.isObscure,
      );

  @override
  List<Object> get props => [userType, isObscure];
}
