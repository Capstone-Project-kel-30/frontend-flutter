part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Authenticating extends AuthState {}

class SignOutLoading extends AuthState {}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;
  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthSuccess extends AuthState {
  final String otp;
  const AuthSuccess(this.otp);

  @override
  List<Object> get props => [otp];
}

class SignUpError extends AuthState {
  final String msg;
  const SignUpError(this.msg);

  @override
  List<Object> get props => [msg];
}

class SignInError extends AuthState {
  final String msg;
  const SignInError(this.msg);

  @override
  List<Object> get props => [msg];
}

class AuthenticationError extends AuthState {
  final String msg;
  const AuthenticationError(this.msg);

  @override
  List<Object> get props => [msg];
}
