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
        final String token = currentUser.data!.token!;
        final String currentEmail = currentUser.data!.email!;
        final String currentName = currentUser.data!.name!;
        final String currentPhone = currentUser.data!.phone!;
        final String currentPassword = currentUser.data!.password!;
        final UserModel user = await userService.updateUserProfile(
          authorization: token,
          name: event.name ?? currentName,
          email: event.email ?? currentEmail,
          password: event.password ?? currentPassword,
          phone: event.phone ?? currentPhone,
        );
        await userInfoService.updateUserInfo(
          name: event.name,
          email: event.email,
          password: event.password,
          phone: event.phone,
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
        final String authorization = currentUser.data!.token!;
        final UserModel user = await userService.getUserProfile(authorization);
        await userInfoService.updateUserInfo(
          memberType: user.data!.memberType!,
        );
        emit(UserSuccess(user));
      } catch (e) {
        emit(UserGetFailed(e.toString()));
      }
    });
  }
}
