part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final BookInfoModel bookInfo;
  final User user;
  const BookingSuccess(this.bookInfo, this.user);

  @override
  List<Object> get props => [bookInfo, user];
}

class BookingFailed extends BookingState {
  final String msg;
  const BookingFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
