part of 'root_cubit.dart';

enum NavBarItem { home, browse, lineskipper, orders, setting }

class RootState extends Equatable {
  const RootState({
    this.navBarItem = NavBarItem.home,
  });

  final NavBarItem navBarItem;

  RootState copyWith({
    NavBarItem? navBarItem,
  }) =>
      RootState(
        navBarItem: navBarItem ?? this.navBarItem,
      );

  @override
  List<Object> get props => [navBarItem];
}
