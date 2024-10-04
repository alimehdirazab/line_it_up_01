import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(const UserHomeState());

  void changeTab(TabOption tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void updateCartItemCount(int productId, int count) {
    // Ensure that the count doesn't go below zero
    final updatedCartItems = Map<int, int>.from(state.cartItems);

    if (count > 0) {
      updatedCartItems[productId] = count; // Update with positive count
    } else {
      updatedCartItems[productId] = 0; // Ensure the count doesn't go negative
    }

    emit(state.copyWith(cartItems: updatedCartItems));
  }
}
