part of 'user_home_cubit.dart';

enum TabOption { delivery, pickup }

enum Category {
  dairyProducts,
  meatSeafood,
  beverages,
}

class UserHomeState extends Equatable {
  const UserHomeState({
    this.selectedTab = TabOption.delivery,
    this.cartItems = const {},
    this.selectedTipChipIndex = -1,
    this.selectedDayChipIndex = -1,
    this.selectedCategory = Category.dairyProducts,
  });

  final TabOption selectedTab;
  final Map<int, int> cartItems; // Map to store cart counts per product ID
  final int selectedTipChipIndex;
  final int selectedDayChipIndex;
  final Category selectedCategory;

  UserHomeState copyWith({
    TabOption? selectedTab,
    Map<int, int>? cartItems,
    int? selectedTipChipIndex,
    int? selectedDayChipIndex,
    Category? selectedCategory,
  }) =>
      UserHomeState(
        selectedTab: selectedTab ?? this.selectedTab,
        cartItems: cartItems ?? this.cartItems,
        selectedTipChipIndex: selectedTipChipIndex ?? this.selectedTipChipIndex,
        selectedDayChipIndex: selectedDayChipIndex ?? this.selectedDayChipIndex,
        selectedCategory: selectedCategory ?? this.selectedCategory,
      );

  @override
  List<Object> get props => [
        selectedTab,
        cartItems,
        selectedTipChipIndex,
        selectedDayChipIndex,
        selectedCategory
      ];
}
