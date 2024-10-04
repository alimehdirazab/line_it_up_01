import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'line_skipper_statistics_state.dart';

class LineSkipperStatisticsCubit extends Cubit<LineSkipperStatisticsState> {
  LineSkipperStatisticsCubit() : super(const LineSkipperStatisticsState());

  void changeTab(int tab) {
    emit(state.copyWith(
      statisticsType: tab,
    ));
  }
}
