import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'line_skipper_home_state.dart';

class LineSkipperHomeCubit extends Cubit<LineSkipperHomeState> {
  LineSkipperHomeCubit() : super(const LineSkipperHomeState());

  void toggleLineSkipperStatus() {
    emit(state.copyWith(
      status: state.status == LineSkipperStatus.offline
          ? LineSkipperStatus.online
          : LineSkipperStatus.offline,
    ));
  }
}
