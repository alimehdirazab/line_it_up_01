part of 'line_skipper_cubit.dart';

enum Catergory {
  grocery,
  fastFood,
  pharmacy,
  coffee,
  pizza,
  chinese,
  tacos,
  thai,
  others
}

class LineSkipperState extends Equatable {
  final int selectedPriceChipIndex;
  final int selectedTipChipIndex;
  final Catergory selectedCategory;

  const LineSkipperState({
    this.selectedPriceChipIndex = -1, // Default -1 means no chip is selected
    this.selectedTipChipIndex = -1,
    this.selectedCategory = Catergory.grocery,
  });

  LineSkipperState copyWith({
    int? selectedPriceChipIndex,
    int? selectedTipChipIndex,
    Catergory? selectedCategory,
  }) {
    return LineSkipperState(
      selectedPriceChipIndex:
          selectedPriceChipIndex ?? this.selectedPriceChipIndex,
      selectedTipChipIndex: selectedTipChipIndex ?? this.selectedTipChipIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object> get props =>
      [selectedPriceChipIndex, selectedTipChipIndex, selectedCategory];
}
