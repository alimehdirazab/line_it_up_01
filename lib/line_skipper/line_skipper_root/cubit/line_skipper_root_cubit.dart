import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'line_skipper_root_state.dart';

class LineSkipperRootCubit extends Cubit<LineSkipperRootState> {
  LineSkipperRootCubit() : super(const LineSkipperRootState());

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(state.copyWith(navBarItem: NavBarItem.home));
        break;
      case NavBarItem.orders:
        emit(state.copyWith(navBarItem: NavBarItem.orders));
        break;
      case NavBarItem.profile:
        emit(state.copyWith(navBarItem: NavBarItem.profile));
        break;
    }
  }
}
