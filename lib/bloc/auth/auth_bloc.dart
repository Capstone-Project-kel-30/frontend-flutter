import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../services/locals/user_info_service.dart';
import '../../services/remotes/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserInfoService userInfoService;
  AuthBloc({
    required this.userInfoService,
    required this.authService,
  }) : super(Authenticating()) {
    on<SignInRequest>((event, emit) async {
      emit(Authenticating());
      try {
        final String email = event.email;
        final String password = event.password;
        final UserModel user = await authService.login(
          email: email,
          password: password,
        );
        final String userToken = user.data!.token!;
        final String name = user.data!.name!;
        final String userPhone = user.data!.phone!;
        final int userId = user.data!.id!;
        final String memberType = user.data!.memberType!;
        await userInfoService.updateUserInfo(
          hasLogin: true,
          email: email,
          id: userId,
          name: name,
          token: userToken,
          phone: userPhone,
          password: password,
          memberType: memberType,
        );
        emit(Authenticated(user));
      } catch (e) {
        emit(SignInError(e.toString()));
      }
    });
    on<SignUpRequest>((event, emit) async {
      emit(Authenticating());
      try {
        final String name = event.name;
        final String email = event.email;
        final String phone = event.phone;
        final String password = event.password;
        final UserModel user = await authService.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );
        emit(AuthSuccess(user.data!.totp!));
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
    on<SignOutRequest>((event, emit) async {
      emit(SignOutLoading());
      await userInfoService.resetUserInfo();
      emit(UnAuthenticated());
    });
    on<OTPRequest>((event, emit) async {
      emit(Authenticating());
      try {
        final email = event.email;
        final UserModel user = await authService.verifyEmail(email: email);
        emit(AuthSuccess(user.data!.totp!));
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
    on<NewOTPRequest>((event, emit) async {
      emit(Authenticating());
      try {
        final email = event.email;
        final UserModel user = await authService.verifyEmail(email: email);
        emit(NewOTPSended(user.data!.totp!));
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
    on<ResetPasswordRequest>((event, emit) async {
      emit(Authenticating());
      try {
        final password = event.password;
        final email = event.email;
        await authService.resetPassword(email: email, password: password);
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
  }
}
