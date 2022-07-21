import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';

import '../dummy/dummy_data.dart';
import 'auth_bloc_test.mocks.dart';
import 'memberhip_bloc_test.mocks.dart';

void main() {
  late MockUserInfoService mockUserInfoService;
  late MockMembershipService mockMembershipService;
  late BookingBloc bookingBloc;
  setUp(() {
    mockUserInfoService = MockUserInfoService();
    mockMembershipService = MockMembershipService();
    bookingBloc = BookingBloc(mockMembershipService, mockUserInfoService);
  });
  group('Initial', () {
    blocTest<BookingBloc, BookingState>(
      'emits [] when nothing is added.',
      build: () => bookingBloc,
      expect: () => const <BookingState>[],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verifyZeroInteractions(mockMembershipService);
      },
    );
  });
  group('Booking Request', () {
    blocTest<BookingBloc, BookingState>(
      'emits [BookingLoading, BookingSuccess] '
      'when BookingRequest is added and success',
      build: () => bookingBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.bookingClass(
          userId: user.data!.id!,
          classId: offlineClasses[0].id!,
          authorization: authorization,
        )).thenAnswer((_) => Future.value(bookInfo));
      },
      act: (bloc) => bloc.add(
        BookingRequest(
          classId: offlineClasses[0].id!,
          userId: user.data!.id!,
        ),
      ),
      expect: () => <BookingState>[
        BookingLoading(),
        BookingSuccess(bookInfo, user.data!),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.bookingClass(
          userId: user.data!.id!,
          classId: offlineClasses[0].id!,
          authorization: authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
    blocTest<BookingBloc, BookingState>(
      'emits [BookingLoading, BookingFailed] '
      'when BookingRequeset is added and failed',
      build: () => bookingBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.bookingClass(
          userId: user.data!.id!,
          classId: offlineClasses[0].id!,
          authorization: authorization,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(BookingRequest(
        classId: offlineClasses[0].id!,
        userId: user.data!.id!,
      )),
      expect: () => <BookingState>[
        BookingLoading(),
        const BookingFailed(errorMsg),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.bookingClass(
          userId: user.data!.id!,
          classId: offlineClasses[0].id!,
          authorization: authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
  });
}
