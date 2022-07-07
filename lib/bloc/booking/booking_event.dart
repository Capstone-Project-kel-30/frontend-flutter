part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class BookingRequest extends BookingEvent {
  final int classId, userId;
  const BookingRequest({required this.classId, required this.userId});

  @override
  List<Object> get props => [classId, userId];
}
