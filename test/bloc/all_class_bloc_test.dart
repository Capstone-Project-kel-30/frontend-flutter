import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/all_class/all_class_bloc.dart';
import 'package:workout_zone/utils/common/constant.dart';
import '../dummy/dummy_data.dart';
import 'all_class_bloc_test.mocks.dart';
import 'package:workout_zone/services/remotes/class_service.dart';

@GenerateMocks([ClassService])
void main() {
  late MockClassService mockClassService;
  late AllClassBloc allClassBloc;
  const errorMsg = "error message";
  setUp(() {
    mockClassService = MockClassService();
    allClassBloc = AllClassBloc(mockClassService);
  });
  group('Initial', () {
    blocTest<AllClassBloc, AllClassState>(
      'emits [] when nothing is added.',
      build: () => allClassBloc,
      expect: () => <AllClassState>[],
      verify: (_) {
        verifyZeroInteractions(mockClassService);
      },
    );
  });
  group('Get All Class', () {
    blocTest<AllClassBloc, AllClassState>(
      'emits [AllClassLoading, AllClassLoaded] '
      'when GetAllClass is added and success',
      build: () => allClassBloc,
      setUp: () {
        when(mockClassService.getAllClass())
            .thenAnswer((_) => Future.value(allClassModel));
      },
      act: (bloc) => bloc.add(GetAllClass()),
      expect: () => <AllClassState>[
        AllClassLoading(),
        AllClassLoaded(allClassModel),
      ],
      verify: (_) {
        verify(mockClassService.getAllClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
    blocTest<AllClassBloc, AllClassState>(
      'emits [AllClassLoading, AllClassError(errorMsg)] '
      'when GetAllClass is added and success',
      build: () => allClassBloc,
      setUp: () {
        when(mockClassService.getAllClass()).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetAllClass()),
      expect: () => <AllClassState>[
        AllClassLoading(),
        const AllClassError(errorMsg),
      ],
      verify: (_) {
        verify(mockClassService.getAllClass()).called(1);
        verifyNoMoreInteractions(mockClassService);
      },
    );
  });
  group('Filtering Class', () {
    blocTest<AllClassBloc, AllClassState>(
      'emits [FilteredClassLoaded] '
      'when FilterClass is added.',
      build: () => allClassBloc,
      act: (bloc) => bloc.add(
        FilterClass(allClass, (e) {
          return e.clastype!.toUpperCase() == offlineClass;
        }),
      ),
      expect: () => <AllClassState>[
        FilteredClassLoaded(offlineClasses),
      ],
    );
  });
}
