part of 'line_skipper_home_cubit.dart';

enum LineSkipperStatus {
  offline,
  online,
}

class LineSkipperHomeState extends Equatable {
  const LineSkipperHomeState({
    this.status = LineSkipperStatus.online,
  });
  final LineSkipperStatus status;
  LineSkipperHomeState copyWith({LineSkipperStatus? status}) =>
      LineSkipperHomeState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status];
}
