part of 'online_class_bloc.dart';

abstract class OnlineClassState extends Equatable {
  const OnlineClassState();

  @override
  List<Object> get props => [];
}

class OnlineClassInitial extends OnlineClassState {}

class OnlineClassLoading extends OnlineClassState {}

class OnlineClassLoaded extends OnlineClassState {
  final ClassModel onlineClass;
  const OnlineClassLoaded(this.onlineClass);

  @override
  List<Object> get props => [onlineClass];
}

class OnlineClassError extends OnlineClassState {
  final String msg;
  const OnlineClassError(this.msg);
  @override
  List<Object> get props => [msg];
}
