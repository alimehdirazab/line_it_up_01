import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_it_up/user_profile/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState>{
  UserProfileCubit() : super(const UserProfileState());


  void toggleNotificationButton() {
    emit(state.copyWith(isNotificationButtonEnabled: !state.isNotificationButtonEnabled));
  }


}