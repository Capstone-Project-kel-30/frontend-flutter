import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../services/locals/user_info_service.dart';
import '../../services/remotes/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  final UserInfoService userInfoService;
  UserBloc({
    required this.userInfoService,
    required this.userService,
  }) : super(UserInitial()) {
    on<UpdateUser>((event, emit) async {
      emit(UserLoading());
      try {
        final currentUser = userInfoService.getUserInfo();
        final String token = currentUser["token"];
        final String currentUsername = currentUser["username"];
        final String currentEmail = currentUser["email"];
        final String currentPhone = currentUser["phone"];
        final String currentPassword = currentUser["password"];
        final UserModel user = await userService.updateUserProfile(
          authorization: token,
          username: event.username ?? currentUsername,
          email: event.email ?? currentEmail,
          password: event.password ?? currentPassword,
          phone: event.phone ?? currentPhone,
        );
        await userInfoService.updateUserInfo(
          username: event.username ?? currentUsername,
          email: event.email ?? currentEmail,
          password: event.password ?? currentPassword,
          phone: event.phone ?? currentPhone,
        );
        emit(UserSuccess(user));
      } catch (e) {
        emit(UserUpdateFailed(e.toString()));
      }
    });
    on<GetUserProfile>((event, emit) async {
      emit(UserLoading());
      try {
        final currentUser = userInfoService.getUserInfo();
        final String authorization = currentUser["token"];
        final UserModel user = await userService.getUserProfile(authorization);
        emit(UserSuccess(user));
      } catch (e) {
        emit(UserGetFailed(e.toString()));
      }
    });
  }
}
