part of 'offline_class_bloc.dart';

abstract class OfflineClassState extends Equatable {
  const OfflineClassState();

  @override
  List<Object> get props => [];
}

class OfflineClassInitial extends OfflineClassState {}

class OfflineClassLoading extends OfflineClassState {}

class OfflineClassLoaded extends OfflineClassState {
  final ClassModel offlineClass;
  const OfflineClassLoaded(this.offlineClass);

  @override
  List<Object> get props => [offlineClass];
}

class OfflineClassError extends OfflineClassState {
  final String msg;
  const OfflineClassError(this.msg);
  @override
  List<Object> get props => [msg];
}
