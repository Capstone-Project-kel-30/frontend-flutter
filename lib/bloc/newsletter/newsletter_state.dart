part of 'newsletter_bloc.dart';

abstract class NewsletterState extends Equatable {
  const NewsletterState();

  @override
  List<Object> get props => [];
}

class NewsletterInitial extends NewsletterState {}

class LoadingNewsletter extends NewsletterState {}

class NewsletterLoaded extends NewsletterState {
  final NewsletterModel newsletters;
  const NewsletterLoaded(this.newsletters);

  @override
  List<Object> get props => [newsletters];
}

class NewsletterLoadFail extends NewsletterState {
  final String msg;
  const NewsletterLoadFail(this.msg);

  @override
  List<Object> get props => [msg];
}
