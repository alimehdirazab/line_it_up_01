part of 'user_home_cubit.dart';

enum TabOption { delivery, pickup }

class UserHomeState extends Equatable {
  const UserHomeState({
    this.selectedTab = TabOption.delivery,
    this.cartItems = const {},
  });

  final TabOption selectedTab;
  final Map<int, int> cartItems; // Map to store cart counts per product ID

  UserHomeState copyWith({
    TabOption? selectedTab,
    Map<int, int>? cartItems,
  }) =>
      UserHomeState(
        selectedTab: selectedTab ?? this.selectedTab,
        cartItems: cartItems ?? this.cartItems,
      );

  @override
  List<Object> get props => [selectedTab, cartItems];
}

