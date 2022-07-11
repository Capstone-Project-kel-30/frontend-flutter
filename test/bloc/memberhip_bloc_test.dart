import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/services/remotes/membership_service.dart';

import '../dummy/dummy_data.dart';
import 'memberhip_bloc_test.mocks.dart';

@GenerateMocks([MembershipService])
void main() {
  late MockMembershipService mockMembershipService;
  late MembershipBloc membershipBloc;
  setUp(() {
    mockMembershipService = MockMembershipService();
    membershipBloc = MembershipBloc(mockMembershipService);
  });
  group('Initial', () {
    blocTest<MembershipBloc, MembershipState>(
      'emits [] when nothing is added.',
      build: () => membershipBloc,
      expect: () => const <MembershipState>[],
      verify: (_) {
        verifyZeroInteractions(mockMembershipService);
      },
    );
  });
  group('Get Membership Detail', () {
    blocTest<MembershipBloc, MembershipState>(
      'emits [LoadingMembershipDetail, MembershipDetailLoaded(membershipMode)] '
      'when MyEvent is added and success',
      build: () => membershipBloc,
      setUp: () {
        when(mockMembershipService.getMembershipDetails())
            .thenAnswer((_) => Future.value(membershipModel));
      },
      act: (bloc) => bloc.add(GetMembershipDetail()),
      expect: () => <MembershipState>[
        LoadingMembershipDetail(),
        MembershipDetailLoaded(membershipModel),
      ],
      verify: (_) {
        verify(mockMembershipService.getMembershipDetails()).called(1);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
    blocTest<MembershipBloc, MembershipState>(
      'emits [LoadingMembershipDetail, MembershipError(errorMsg)] '
      'when MyEvent is added and failed',
      build: () => membershipBloc,
      setUp: () {
        when(mockMembershipService.getMembershipDetails()).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetMembershipDetail()),
      expect: () => <MembershipState>[
        LoadingMembershipDetail(),
        const MembershipError(errorMsg),
      ],
      verify: (_) {
        verify(mockMembershipService.getMembershipDetails()).called(1);
        verifyNoMoreInteractions(mockMembershipService);
      },
    );
  });
}
