import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'line_skipper_manage_account_state.dart';

class LineSkipperManageAccountCubit
    extends Cubit<LineSkipperManageAccountState> {
  LineSkipperManageAccountCubit()
      : super(const LineSkipperManageAccountState());

  void toggleNewPassword() {
    emit(state.copyWith(
      isNewPasswordObscure: !state.isNewPasswordObscure,
    ));
  }

  void toggleReEnterNewPassword() {
    emit(state.copyWith(
      isReEnterNewPasswordObsure: !state.isReEnterNewPasswordObsure,
    ));
  }
}
