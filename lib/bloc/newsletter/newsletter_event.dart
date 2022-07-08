part of 'newsletter_bloc.dart';

abstract class NewsletterEvent extends Equatable {
  const NewsletterEvent();

  @override
  List<Object> get props => [];
}

class GetAllNewsletter extends NewsletterEvent {}

class GetNewsletterById extends NewsletterEvent {
  final String id;
  const GetNewsletterById(this.id);

  @override
  List<Object> get props => [id];
}
