part of 'line_skipper_manage_account_cubit.dart';

class LineSkipperManageAccountState extends Equatable {
  const LineSkipperManageAccountState(
      {this.isNewPasswordObscure = true,
      this.isReEnterNewPasswordObsure = true});

  final bool isNewPasswordObscure;
  final bool isReEnterNewPasswordObsure;

  LineSkipperManageAccountState copyWith(
          {bool? isNewPasswordObscure, bool? isReEnterNewPasswordObsure}) =>
      LineSkipperManageAccountState(
        isNewPasswordObscure: isNewPasswordObscure ?? this.isNewPasswordObscure,
        isReEnterNewPasswordObsure:
            isReEnterNewPasswordObsure ?? this.isReEnterNewPasswordObsure,
      );

  @override
  List<Object> get props => [isNewPasswordObscure, isReEnterNewPasswordObsure];
}
