part of 'line_skipper_root_cubit.dart';

enum NavBarItem { home, orders, profile }

class LineSkipperRootState extends Equatable {
  const LineSkipperRootState({
    this.navBarItem = NavBarItem.home,
  });

  final NavBarItem navBarItem;

  LineSkipperRootState copyWith({
    NavBarItem? navBarItem,
  }) =>
      LineSkipperRootState(
        navBarItem: navBarItem ?? this.navBarItem,
      );

  @override
  List<Object> get props => [navBarItem];
}
