part of 'root_cubit.dart';

enum NavBarItem { home, delivery, lineskipper, orders, profile }

class RootState extends Equatable {
  const RootState({
    this.navBarItem = NavBarItem.lineskipper,
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
