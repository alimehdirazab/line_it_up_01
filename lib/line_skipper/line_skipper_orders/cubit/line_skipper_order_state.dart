part of 'line_skipper_order_cubit.dart';

class LineSkipperOrderState extends Equatable {
  const LineSkipperOrderState(
      {this.orderType = 0, this.selectedReasonIndex = 0});

  final int orderType;
  final int selectedReasonIndex;

  LineSkipperOrderState copyWith({int? orderType, int? selectedReasonIndex}) =>
      LineSkipperOrderState(
        orderType: orderType ?? this.orderType,
        selectedReasonIndex: selectedReasonIndex ?? this.selectedReasonIndex,
      );

  @override
  List<Object> get props => [orderType, selectedReasonIndex];
}
