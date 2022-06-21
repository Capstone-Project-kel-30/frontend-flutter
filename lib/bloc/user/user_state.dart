part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel user;
  const UserSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserGetFailed extends UserState {
  final String msg;
  const UserGetFailed(this.msg);

  @override
  List<Object> get props => [msg];
}

class UserUpdateFailed extends UserState {
  final String msg;
  const UserUpdateFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
