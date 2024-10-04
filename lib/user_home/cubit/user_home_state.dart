part of 'user_home_cubit.dart';


enum TabOption { delivery, pickup }

class UserHomeState extends Equatable {
  const UserHomeState({this.selectedTab = TabOption.delivery});

  final TabOption selectedTab;

  UserHomeState copyWith({TabOption? selectedTab}) => UserHomeState(
        selectedTab: selectedTab ?? this.selectedTab,
      );

  @override
  List<Object> get props => [selectedTab];
}
