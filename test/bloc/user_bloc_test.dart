import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/remotes/user_service.dart';

import '../dummy/dummy_data.dart';
import 'auth_bloc_test.mocks.dart';
import 'user_bloc_test.mocks.dart';

@GenerateMocks([UserService])
void main() {
  late MockUserInfoService mockUserInfoService;
  late MockUserService mockUserService;
  late UserBloc userBloc;
  const String newEmail = "tested2@gmail.com";
  const String newName = "tested2";
  const String newPassword = "tested1234";
  const String newPhone = "0912991209911";
  final UserModel newUser = UserModel(
    data: User(
      token: authorization,
      email: newEmail,
      password: newPassword,
      name: newName,
      phone: newPhone,
    ),
  );
  setUp(() {
    mockUserInfoService = MockUserInfoService();
    mockUserService = MockUserService();
    userBloc = UserBloc(
      userInfoService: mockUserInfoService,
      userService: mockUserService,
    );
  });
  group('Initial', () {
    blocTest<UserBloc, UserState>(
      'emits [] when nothing is added.',
      build: () => userBloc,
      expect: () => const <UserState>[],
      verify: (_) {
        verifyZeroInteractions(mockUserService);
        verifyZeroInteractions(mockUserInfoService);
      },
    );
  });
  group('Update User', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserSuccess] '
      'when UpdateUser is added and success',
      build: () => userBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockUserService.updateUserProfile(
          authorization: authorization,
          email: newEmail,
          name: newName,
          password: newPassword,
          phone: newPhone,
        )).thenAnswer((_) => Future.value(newUser));
      },
      act: (bloc) => bloc.add(
        const UpdateUser(
          email: newEmail,
          phone: newPhone,
          name: newName,
          password: newPassword,
        ),
      ),
      expect: () => <UserState>[
        UserLoading(),
        UserSuccess(newUser),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(
          mockUserService.updateUserProfile(
            authorization: authorization,
            email: newEmail,
            name: newName,
            password: newPassword,
            phone: newPhone,
          ),
        ).called(1);
        verify(mockUserInfoService.updateUserInfo(
          email: newEmail,
          name: newName,
          password: newPassword,
          phone: newPhone,
        )).called(1);
        verifyNoMoreInteractions(mockUserService);
        verifyNoMoreInteractions(mockUserInfoService);
      },
    );
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserUpdateFailed] '
      'when UpdateUser is added and failed',
      build: () => userBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockUserService.updateUserProfile(
          authorization: authorization,
          email: newEmail,
          name: newName,
          password: newPassword,
          phone: newPhone,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(
        const UpdateUser(
          email: newEmail,
          phone: newPhone,
          name: newName,
          password: newPassword,
        ),
      ),
      expect: () => <UserState>[
        UserLoading(),
        const UserUpdateFailed(errorMsg),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(
          mockUserService.updateUserProfile(
            authorization: authorization,
            email: newEmail,
            name: newName,
            password: newPassword,
            phone: newPhone,
          ),
        ).called(1);
        verifyNever(mockUserInfoService.updateUserInfo(
          email: newEmail,
          name: newName,
          password: newPassword,
          phone: newPhone,
        ));
        verifyNoMoreInteractions(mockUserService);
        verifyNoMoreInteractions(mockUserInfoService);
      },
    );
  });
  group('Get User', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserSuccess] '
      'when GetUserProfile is added and success',
      build: () => userBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockUserService.getUserProfile(authorization))
            .thenAnswer((_) => Future.value(user));
      },
      act: (bloc) => bloc.add(GetUserProfile()),
      expect: () => <UserState>[
        UserLoading(),
        UserSuccess(user),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockUserService.getUserProfile(authorization)).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockUserService);
      },
    );
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserGetFailed] '
      'when GetUserProfile is added and failed',
      build: () => userBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockUserService.getUserProfile(authorization)).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetUserProfile()),
      expect: () => <UserState>[
        UserLoading(),
        const UserGetFailed(errorMsg),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockUserService.getUserProfile(authorization)).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockUserService);
      },
    );
  });
}
