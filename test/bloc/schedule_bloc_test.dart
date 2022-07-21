import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/utils/common/constant.dart';

import '../dummy/dummy_data.dart';
import 'auth_bloc_test.mocks.dart';
import 'memberhip_bloc_test.mocks.dart';

void main() {
  late ScheduleBloc scheduleBloc;
  late MockMembershipService mockMembershipService;
  late MockUserInfoService mockUserInfoService;
  setUp(() {
    mockMembershipService = MockMembershipService();
    mockUserInfoService = MockUserInfoService();
    scheduleBloc = ScheduleBloc(mockMembershipService, mockUserInfoService);
  });
  group('initial', () {
    blocTest<ScheduleBloc, ScheduleState>(
      'emits [] when nothing is added.',
      build: () => scheduleBloc,
      expect: () => const <ScheduleState>[],
    );
  });
  group('get all schedule', () {
    blocTest<ScheduleBloc, ScheduleState>(
      'emits [LoadingSchedule, ScheduleLoaded] '
      'when GetSchedule is added and success',
      build: () => scheduleBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.userClassSchedule(authorization)).thenAnswer(
          (_) => Future.value(scheduleInfoModel),
        );
      },
      act: (bloc) => bloc.add(GetSchedule()),
      expect: () => <ScheduleState>[
        LoadingSchedule(),
        const ScheduleLoaded(scheduleInfoModel),
      ],
    );
    blocTest<ScheduleBloc, ScheduleState>(
      'emits [LoadingSchedule, ScheduleError] '
      'when GetSchedule is added and failed',
      build: () => scheduleBloc,
      setUp: () {
        when(mockUserInfoService.getUserInfo()).thenReturn(user);
        when(mockMembershipService.userClassSchedule(authorization))
            .thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetSchedule()),
      expect: () => <ScheduleState>[
        LoadingSchedule(),
        const ScheduleError(errorMsg),
      ],
    );
  });
  group(
    'filter schedule',
    () {
      blocTest<ScheduleBloc, ScheduleState>(
        'emits [FilteredClassLoaded] '
        'when FilterClass is added.',
        build: () => scheduleBloc,
        act: (bloc) => bloc.add(
          FilterSchedule((e) {
            return e.clastype!.toUpperCase() == offlineClass;
          }, allClass),
        ),
        expect: () => <ScheduleState>[
          FilteredSchedule(offlineClasses),
        ],
      );
    },
  );
}
