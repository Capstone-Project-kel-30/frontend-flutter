part of 'online_class_bloc.dart';

abstract class OnlineClassEvent extends Equatable {
  const OnlineClassEvent();

  @override
  List<Object> get props => [];
}

class GetAllOnlineClass extends OnlineClassEvent {}

class GetOnlineClassById extends OnlineClassEvent {
  final String id;
  const GetOnlineClassById(this.id);

  @override
  List<Object> get props => [id];
}
