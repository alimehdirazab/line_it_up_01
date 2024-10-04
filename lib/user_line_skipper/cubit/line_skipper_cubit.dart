import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'line_skipper_state.dart';

class LineSkipperCubit extends Cubit<LineSkipperState> {
  LineSkipperCubit() : super(const LineSkipperState());

  // Method to select a price chip
  void selectPriceChip(int selectedPriceChipIndex) {
    emit(state.copyWith(selectedPriceChipIndex: selectedPriceChipIndex));
  }

  // Method to select a tip chip
  void selectTipChip(int selectedTipChipIndex) {
    emit(state.copyWith(selectedTipChipIndex: selectedTipChipIndex));
  }

  // Method to select a category
  void selectCategory(Catergory selectedCategoryIndex) {
    emit(state.copyWith(selectedCategory: selectedCategoryIndex));
  }
}
