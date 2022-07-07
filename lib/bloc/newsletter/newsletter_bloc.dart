import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/models/newsletter__model.dart';
import 'package:workout_zone/services/remotes/newsletter_service.dart';

part 'newsletter_event.dart';
part 'newsletter_state.dart';

class NewsletterBloc extends Bloc<NewsletterEvent, NewsletterState> {
  NewsletterService newsletterService;
  NewsletterBloc(this.newsletterService) : super(NewsletterInitial()) {
    on<GetAllNewsletter>((event, emit) async {
      emit(LoadingNewsletter());
      try {
        final NewsletterModel newsletters =
            await newsletterService.getAllNewsletter();
        emit(NewsletterLoaded(newsletters));
      } catch (e) {
        emit(NewsletterLoadFail(e.toString()));
      }
    });
    on<GetNewsletterById>((event, emit) async {
      emit(LoadingNewsletter());
      try {
        final String id = event.id;
        final NewsletterModel newsletter =
            await newsletterService.getNewsletterById(id);
        emit(NewsletterLoaded(newsletter));
      } catch (e) {
        emit(NewsletterLoadFail(e.toString()));
      }
    });
  }
}
