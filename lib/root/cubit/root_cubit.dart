import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(const RootState());

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(state.copyWith(navBarItem: NavBarItem.home));
        break;
      case NavBarItem.delivery:
        emit(state.copyWith(navBarItem: NavBarItem.delivery));
        break;
      case NavBarItem.lineskipper:
        emit(state.copyWith(navBarItem: NavBarItem.lineskipper));
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
