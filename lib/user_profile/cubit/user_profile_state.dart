import 'package:equatable/equatable.dart';

class UserProfileState extends Equatable{
  final bool isNotificationButtonEnabled;

  const UserProfileState({this.isNotificationButtonEnabled = false});

  UserProfileState copyWith({bool? isNotificationButtonEnabled}) {
    return UserProfileState(
      isNotificationButtonEnabled: isNotificationButtonEnabled ?? this.isNotificationButtonEnabled,
    );
  }
  @override
  // TODO: implement props
  List<Object> get props => [isNotificationButtonEnabled];

}