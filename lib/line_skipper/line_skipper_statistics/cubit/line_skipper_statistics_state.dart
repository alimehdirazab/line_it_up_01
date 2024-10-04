part of 'line_skipper_statistics_cubit.dart';

class LineSkipperStatisticsState extends Equatable {
  const LineSkipperStatisticsState({this.statisticsType = 0});

  final int statisticsType;

  LineSkipperStatisticsState copyWith({int? statisticsType}) =>
      LineSkipperStatisticsState(
        statisticsType: statisticsType ?? this.statisticsType,
      );

  @override
  List<Object> get props => [statisticsType];
}
