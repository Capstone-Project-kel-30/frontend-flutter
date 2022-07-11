import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';
import '../dummy/dummy_data.dart';
import 'auth_bloc_test.mocks.dart';
import 'memberhip_bloc_test.mocks.dart';

void main() {
  late MockMembershipService mockMembershipService;
  late MockUserInfoService mockUserInfoService;
  late MembershipPaymentBloc membershipPaymentBloc;
  setUp(() {
    mockMembershipService = MockMembershipService();
    mockUserInfoService = MockUserInfoService();
    membershipPaymentBloc = MembershipPaymentBloc(
      mockMembershipService,
      mockUserInfoService,
    );
  });
  group('Initial', () {
    blocTest<MembershipPaymentBloc, MembershipPaymentState>(
      'emits [] when nothing is added.',
      build: () => membershipPaymentBloc,
      expect: () => const <MembershipPaymentState>[],
      verify: (_) {
        verifyZeroInteractions(mockUserInfoService);
        verifyZeroInteractions(mockMembershipService);
      },
    );
  });
  group('Register Membership', () {
    blocTest<MembershipPaymentBloc, MembershipPaymentState>(
      'emits [PaymentLoading, PaymentRequestSuccess] '
      'when MembershipPaymentRequest is added and success',
      build: () => membershipPaymentBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.membershipRegister(
          membershipId: membershipId,
          authorization: authorization,
        )).thenAnswer((_) => Future.value(membershipPayment));
      },
      act: (bloc) => bloc.add(const MembershipRegisterRequest(membershipId)),
      expect: () => <MembershipPaymentState>[
        PaymentLoading(),
        PaymentRequestSuccess(membershipPayment),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.membershipRegister(
          membershipId: membershipId,
          authorization: authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
    blocTest<MembershipPaymentBloc, MembershipPaymentState>(
      'emits [PaymentLoading, PaymentRequestError] '
      'when MembershipPaymentRequest is added and failed',
      build: () => membershipPaymentBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.membershipRegister(
          membershipId: membershipId,
          authorization: authorization,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(const MembershipRegisterRequest(membershipId)),
      expect: () => <MembershipPaymentState>[
        PaymentLoading(),
        const PaymentRequestError(errorMsg),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.membershipRegister(
          membershipId: membershipId,
          authorization: authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
  });
  group('Get Payment Info', () {
    blocTest<MembershipPaymentBloc, MembershipPaymentState>(
      'emits [PaymentLoading, PaymentRequestSuccess] '
      'when GetMembershipPaymentInfo is added and success',
      build: () => membershipPaymentBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.membershipPaymentInfo(authorization))
            .thenAnswer((_) => Future.value(membershipPayment));
      },
      act: (bloc) => bloc.add(GetMembershipPaymentInfo()),
      expect: () => <MembershipPaymentState>[
        PaymentLoading(),
        PaymentRequestSuccess(membershipPayment),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.membershipPaymentInfo(
          authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
    blocTest<MembershipPaymentBloc, MembershipPaymentState>(
      'emits [PaymentLoading, PaymentRequestError] '
      'when GetMembershipPaymentInfo is added and failed',
      build: () => membershipPaymentBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.membershipPaymentInfo(
          authorization,
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetMembershipPaymentInfo()),
      expect: () => <MembershipPaymentState>[
        PaymentLoading(),
        const PaymentRequestError(errorMsg),
      ],
      verify: (_) {
        verify(mockUserInfoService.getUserInfo()).called(1);
        verify(mockMembershipService.membershipPaymentInfo(
          authorization,
        )).called(1);
        verifyNoMoreInteractions(mockUserInfoService);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
  });
}
