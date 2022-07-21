import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/services/remotes/newsletter_service.dart';

import '../dummy/dummy_data.dart';
import 'newsletter_bloc_test.mocks.dart';

@GenerateMocks([NewsletterService])
void main() {
  late MockNewsletterService mockNewsletterService;
  late NewsletterBloc newsletterBloc;
  setUp(() {
    mockNewsletterService = MockNewsletterService();
    newsletterBloc = NewsletterBloc(mockNewsletterService);
  });
  group('Initial', () {
    blocTest<NewsletterBloc, NewsletterState>(
      'emits [] when nothing is added.',
      build: () => newsletterBloc,
      expect: () => const <NewsletterState>[],
      verify: (_) {
        verifyZeroInteractions(mockNewsletterService);
      },
    );
  });
  group('Get All Newsletter', () {
    blocTest<NewsletterBloc, NewsletterState>(
      'emits [LoadingNewsletter, NewsletterLoaded] '
      'when GetAllNewsletter is added and success',
      build: () => newsletterBloc,
      setUp: () {
        when(mockNewsletterService.getAllNewsletter())
            .thenAnswer((_) => Future.value(newsletterModel));
      },
      act: (bloc) => bloc.add(GetAllNewsletter()),
      expect: () => <NewsletterState>[
        LoadingNewsletter(),
        const NewsletterLoaded(newsletterModel),
      ],
      verify: (_) {
        verify(mockNewsletterService.getAllNewsletter()).called(1);
        verifyNoMoreInteractions(mockNewsletterService);
      },
    );
    blocTest<NewsletterBloc, NewsletterState>(
      'emits [LoadingNewsletter, NewsletterLoadFail] '
      'when GetAllNewsletter is added and failed',
      build: () => newsletterBloc,
      setUp: () {
        when(mockNewsletterService.getAllNewsletter()).thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetAllNewsletter()),
      expect: () => <NewsletterState>[
        LoadingNewsletter(),
        const NewsletterLoadFail(errorMsg),
      ],
      verify: (_) {
        verify(mockNewsletterService.getAllNewsletter()).called(1);
        verifyNoMoreInteractions(mockNewsletterService);
      },
    );
  });
  group('Get Newsletter by Id', () {
    blocTest<NewsletterBloc, NewsletterState>(
      'emits [LoadingNewsletter, NewsletterLoaded] '
      'when GetNewsletterById is added and success',
      build: () => newsletterBloc,
      setUp: () {
        when(mockNewsletterService.getNewsletterById(newsletter.id.toString()))
            .thenAnswer((_) => Future.value(newsletterModel));
      },
      act: (bloc) => bloc.add(GetNewsletterById(newsletter.id.toString())),
      expect: () => <NewsletterState>[
        LoadingNewsletter(),
        const NewsletterLoaded(newsletterModel),
      ],
      verify: (_) {
        verify(
          mockNewsletterService.getNewsletterById(newsletter.id.toString()),
        ).called(1);
        verifyNoMoreInteractions(mockNewsletterService);
      },
    );
    blocTest<NewsletterBloc, NewsletterState>(
      'emits [LoadingNewsletter, NewsletterLoadFail] '
      'when GetNewsletterById is added and failed',
      build: () => newsletterBloc,
      setUp: () {
        when(mockNewsletterService.getNewsletterById(newsletter.id.toString()))
            .thenThrow(errorMsg);
      },
      act: (bloc) => bloc.add(GetNewsletterById(newsletter.id.toString())),
      expect: () => <NewsletterState>[
        LoadingNewsletter(),
        const NewsletterLoadFail(errorMsg),
      ],
      verify: (_) {
        verify(mockNewsletterService
                .getNewsletterById(newsletter.id.toString()))
            .called(1);
        verifyNoMoreInteractions(mockNewsletterService);
      },
    );
  });
}
