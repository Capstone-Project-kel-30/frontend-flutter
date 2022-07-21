import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';

import '../dummy/dummy_data.dart';
import 'all_class_bloc_test.mocks.dart';

void main() {
  late MockClassService mockClassService;
  late OnlineClassBloc onlineClassBloc;
  setUp(() {
    mockClassService = MockClassService();
    onlineClassBloc = OnlineClassBloc(mockClassService);
  });
  group('Initial', () {
    blocTest<OnlineClassBloc, OnlineClassState>(
      'emits [] when nothing is added.',
      build: () => onlineClassBloc,
      expect: () => const <OnlineClassState>[],
      verify: (_) {
        verifyZeroInteractions(mockClassService);
      },
    );
  });
  group('Get All Online Class', () {
    blocTest<OnlineClassBloc, OnlineClassState>(
      'emits [OnlineClassLoading, OnlineClassLoaded] '
      'when GetAllOnlineClass is added and success',
      build: () => onlineClassBloc,
      setUp: () {
        when(mockClassService.getAllOnlineClass())
            .thenAnswer((_) => Future.value(onlineClassModel));
      },
      act: (bloc) => bloc.add(GetAllOnlineClass()),
      expect: () => <OnlineClassState>[
        OnlineClassLoading(),
        OnlineClassLoaded(onlineClassModel),
      ],
      verify: (_) {
        verify(mockClassService.getAllOnlineClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
    blocTest<OnlineClassBloc, OnlineClassState>(
      'emits [OnlineClassLoading, OnlineClassError] '
      'when GetAllOnlineClass is added and failed',
      build: () => onlineClassBloc,
      setUp: () {
        when(mockClassService.getAllOnlineClass()).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetAllOnlineClass()),
      expect: () => <OnlineClassState>[
        OnlineClassLoading(),
        const OnlineClassError(errorMsg),
      ],
      verify: (_) {
        verify(mockClassService.getAllOnlineClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
  });
  group('Get Online Class By Id', () {
    blocTest<OnlineClassBloc, OnlineClassState>(
      'emits [OnlineClassLoading, OnlineClassLoaded] '
      'when GetOnlineClassById is added and success',
      build: () => onlineClassBloc,
      setUp: () {
        when(mockClassService
                .getOnlineClassById(onlineClasses[0].id.toString()))
            .thenAnswer((_) => Future.value(onlineClassModel));
      },
      act: (bloc) => bloc.add(
        GetOnlineClassById(onlineClasses[0].id.toString()),
      ),
      expect: () => <OnlineClassState>[
        OnlineClassLoading(),
        OnlineClassLoaded(onlineClassModel),
      ],
      verify: (_) {
        verify(mockClassService.getOnlineClassById(
          onlineClasses[0].id.toString(),
        )).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
    blocTest<OnlineClassBloc, OnlineClassState>(
      'emits [OnlineClassLoading, OnlineClassError] '
      'when GetOnlineClassById is added and failed',
      build: () => onlineClassBloc,
      setUp: () {
        when(mockClassService.getOnlineClassById(
          onlineClasses[0].id.toString(),
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetOnlineClassById(
        onlineClasses[0].id.toString(),
      )),
      expect: () => <OnlineClassState>[
        OnlineClassLoading(),
        const OnlineClassError(errorMsg),
      ],
      verify: (_) {
        verify(mockClassService.getOnlineClassById(
          onlineClasses[0].id.toString(),
        )).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
  });
}
