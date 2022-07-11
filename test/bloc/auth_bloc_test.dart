import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/auth/auth_bloc.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/locals/user_info_service.dart';
import 'package:workout_zone/services/remotes/auth_service.dart';

import '../dummy/dummy_data.dart';
import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthService, UserInfoService])
void main() {
  late AuthBloc authBloc;
  late MockAuthService mockAuthService;
  late MockUserInfoService mockUserInfoService;
  setUp(() {
    mockAuthService = MockAuthService();
    mockUserInfoService = MockUserInfoService();
    authBloc = AuthBloc(
      userInfoService: mockUserInfoService,
      authService: mockAuthService,
    );
  });
  group('Initial', () {
    blocTest<AuthBloc, AuthState>(
      'emits [] when MyEvent nothing added.',
      build: () => authBloc,
      expect: () => const <AuthState>[],
    );
  });
  group('Login', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, Authenticated(user)] '
      'when SignInRequest is added and success',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.login(
          email: email,
          password: password,
        )).thenAnswer(
          (_) => Future.value(user),
        );
      },
      act: (bloc) => bloc.add(
        const SignInRequest(email, password),
      ),
      expect: () => <AuthState>[Authenticating(), Authenticated(user)],
      verify: (_) {
        verify(mockUserInfoService.updateUserInfo(
          hasLogin: true,
          email: email,
          id: userId,
          name: name,
          token: authorization,
          phone: phone,
          password: password,
          memberType: memberType,
        )).called(1);
        verify(mockAuthService.login(
          email: email,
          password: password,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
        verifyNoMoreInteractions(mockUserInfoService);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, SignInError(error)] '
      'when SignInRequest is added and failed ',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.login(
          email: email,
          password: password,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(
        const SignInRequest(email, password),
      ),
      expect: () => <AuthState>[Authenticating(), const SignInError(errorMsg)],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verify(mockAuthService.login(
          email: email,
          password: password,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
  });
  group('Register', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, AuthSuccess(OTP)] '
      'when SignUpRequest is added and success',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        )).thenAnswer(
          (_) => Future.value(user),
        );
      },
      act: (bloc) => bloc.add(
        const SignUpRequest(name, email, password, phone),
      ),
      expect: () => <AuthState>[Authenticating(), const AuthSuccess(otp)],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verify(mockAuthService.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, SignUpError(error)] '
      'when SignUpRequest is added and failed ',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(
        const SignUpRequest(name, email, password, phone),
      ),
      expect: () => <AuthState>[Authenticating(), const SignUpError(errorMsg)],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verify(mockAuthService.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
  });
  group('Sign Out', () {
    blocTest<AuthBloc, AuthState>(
      'emits [SignOutLoading, UnAuthenticated] '
      'when SignOutRequest is added',
      build: () => authBloc,
      act: (bloc) => bloc.add(SignOutRequest()),
      expect: () => <AuthState>[SignOutLoading(), UnAuthenticated()],
      verify: (_) {
        verify(mockUserInfoService.resetUserInfo()).called(1);
        verifyZeroInteractions(mockAuthService);
        verifyNoMoreInteractions(mockUserInfoService);
      },
    );
  });
  group('OTP Request', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, AuthSuccess(OTP)] '
      'when OTPRequest is added and success',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.verifyEmail(email: email))
            .thenAnswer((_) => Future.value(user));
      },
      act: (bloc) => bloc.add(const OTPRequest(email)),
      expect: () => <AuthState>[Authenticating(), const AuthSuccess(otp)],
      verify: (_) {
        verify(mockAuthService.verifyEmail(email: email)).called(1);
        verifyZeroInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, AuthenticationError(errorMsg)] '
      'when OTPRequest is added and failed',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.verifyEmail(email: email)).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(const OTPRequest(email)),
      expect: () => <AuthState>[
        Authenticating(),
        const AuthenticationError(errorMsg),
      ],
      verify: (_) {
        verify(mockAuthService.verifyEmail(email: email)).called(1);
        verifyZeroInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
  });
  group('New OTP Request', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, NewOTPSended(OTP)] '
      'when NewOTPRequest is added and success',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.verifyEmail(email: email))
            .thenAnswer((_) => Future.value(user));
      },
      act: (bloc) => bloc.add(const NewOTPRequest(email)),
      expect: () => <AuthState>[Authenticating(), const NewOTPSended(otp)],
      verify: (_) {
        verify(mockAuthService.verifyEmail(email: email)).called(1);
        verifyZeroInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, AuthenticationError(errorMsg)] '
      'when NewOTPRequest is added and failed',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.verifyEmail(email: email)).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(const NewOTPRequest(email)),
      expect: () => <AuthState>[
        Authenticating(),
        const AuthenticationError(errorMsg),
      ],
      verify: (_) {
        verify(mockAuthService.verifyEmail(email: email)).called(1);
        verifyZeroInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
  });
  group('Reset Password', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, UnAuthenticated] '
      'when ResetPasswordRequest is added and success',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.resetPassword(
          email: email,
          password: password,
        )).thenAnswer((_) => Future.value(user));
      },
      act: (bloc) => bloc.add(const ResetPasswordRequest(email, password)),
      expect: () => <AuthState>[Authenticating(), UnAuthenticated()],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verify(mockAuthService.resetPassword(
          email: email,
          password: password,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits [Authenticating, AuthenticationError(errorMsg)] '
      'when ResetPasswordRequest is added and failed',
      build: () => authBloc,
      setUp: () {
        when(mockAuthService.resetPassword(
          email: email,
          password: password,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(const ResetPasswordRequest(email, password)),
      expect: () => <AuthState>[
        Authenticating(),
        const AuthenticationError(errorMsg),
      ],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verify(mockAuthService.resetPassword(
          email: email,
          password: password,
        )).called(1);
        verifyNoMoreInteractions(mockAuthService);
      },
    );
  });
}
