part of 'user_home_cubit.dart';

enum TabOption { delivery, pickup }

class UserHomeState extends Equatable {
  const UserHomeState({
    this.selectedTab = TabOption.delivery,
    this.cartItems = const {},
    this.selectedTipChipIndex = -1,
    this.selectedDayChipIndex = -1,
  });

  final TabOption selectedTab;
  final Map<int, int> cartItems; // Map to store cart counts per product ID
  final int selectedTipChipIndex;
  final int selectedDayChipIndex;

  UserHomeState copyWith({
    TabOption? selectedTab,
    Map<int, int>? cartItems,
    int? selectedTipChipIndex,
    int? selectedDayChipIndex,
  }) =>
      UserHomeState(
        selectedTab: selectedTab ?? this.selectedTab,
        cartItems: cartItems ?? this.cartItems,
        selectedTipChipIndex: selectedTipChipIndex ?? this.selectedTipChipIndex,
        selectedDayChipIndex: selectedDayChipIndex ?? this.selectedDayChipIndex,
      );

  @override
  List<Object> get props =>
      [selectedTab, cartItems, selectedTipChipIndex, selectedDayChipIndex];
}
