import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';

import '../dummy/dummy_data.dart';
import 'all_class_bloc_test.mocks.dart';

void main() {
  late MockClassService mockClassService;
  late OfflineClassBloc offlineClassBloc;
  setUp(() {
    mockClassService = MockClassService();
    offlineClassBloc = OfflineClassBloc(mockClassService);
  });
  group('Initial', () {
    blocTest<OfflineClassBloc, OfflineClassState>(
      'emits [] when nothing is added.',
      build: () => offlineClassBloc,
      expect: () => const <OfflineClassState>[],
      verify: (_) {
        verifyZeroInteractions(mockClassService);
      },
    );
  });
  group('Get All Offline Class', () {
    blocTest<OfflineClassBloc, OfflineClassState>(
      'emits [OfflineClassLoading, OfflineClassLoaded] '
      'when GetAllOfflineClass is added and success',
      build: () => offlineClassBloc,
      setUp: () {
        when(mockClassService.getAllOfflineClass())
            .thenAnswer((_) => Future.value(offlineClassModel));
      },
      act: (bloc) => bloc.add(GetAllOfflineClass()),
      expect: () => <OfflineClassState>[
        OfflineClassLoading(),
        OfflineClassLoaded(offlineClassModel),
      ],
      verify: (_) {
        verify(mockClassService.getAllOfflineClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
    blocTest<OfflineClassBloc, OfflineClassState>(
      'emits [OfflineClassLoading, OfflineClassError] '
      'when GetAllOfflineClass is added and failed',
      build: () => offlineClassBloc,
      setUp: () {
        when(mockClassService.getAllOfflineClass()).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetAllOfflineClass()),
      expect: () => <OfflineClassState>[
        OfflineClassLoading(),
        const OfflineClassError(errorMsg),
      ],
      verify: (_) {
        verify(mockClassService.getAllOfflineClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
  });
  group('Get Offline Class By Id', () {
    blocTest<OfflineClassBloc, OfflineClassState>(
      'emits [OfflineClassLoading, OfflineClassLoaded] '
      'when GetOfflineClassById is added and success',
      build: () => offlineClassBloc,
      setUp: () {
        when(mockClassService
                .getOfflineClassById(offlineClasses[0].id.toString()))
            .thenAnswer((_) => Future.value(offlineClassModel));
      },
      act: (bloc) => bloc.add(
        GetOfflineClassById(offlineClasses[0].id.toString()),
      ),
      expect: () => <OfflineClassState>[
        OfflineClassLoading(),
        OfflineClassLoaded(offlineClassModel),
      ],
      verify: (_) {
        verify(mockClassService.getOfflineClassById(
          offlineClasses[0].id.toString(),
        )).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
    blocTest<OfflineClassBloc, OfflineClassState>(
      'emits [OfflineClassLoading, OfflineClassError] '
      'when GetOfflineClassById is added and failed',
      build: () => offlineClassBloc,
      setUp: () {
        when(mockClassService.getOfflineClassById(
          offlineClasses[0].id.toString(),
        )).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetOfflineClassById(
        offlineClasses[0].id.toString(),
      )),
      expect: () => <OfflineClassState>[
        OfflineClassLoading(),
        const OfflineClassError(errorMsg),
      ],
      verify: (_) {
        verify(mockClassService.getOfflineClassById(
          offlineClasses[0].id.toString(),
        )).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
  });
}
