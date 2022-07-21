part of 'offline_class_bloc.dart';

abstract class OfflineClassEvent extends Equatable {
  const OfflineClassEvent();

  @override
  List<Object> get props => [];
}

class GetAllOfflineClass extends OfflineClassEvent {}

class GetOfflineClassById extends OfflineClassEvent {
  final String id;
  const GetOfflineClassById(this.id);

  @override
  List<Object> get props => [id];
}
