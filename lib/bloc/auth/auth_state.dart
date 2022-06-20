part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Authenticating extends AuthState {}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;
  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationError extends AuthState {
  final String msg;
  const AuthenticationError(this.msg);

  @override
  List<Object> get props => [msg];
}
