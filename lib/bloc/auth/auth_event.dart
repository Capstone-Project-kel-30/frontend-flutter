part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInRequest extends AuthEvent {
  final String email, password;
  const SignInRequest(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpRequest extends AuthEvent {
  final String username, email, password, phone;
  const SignUpRequest(this.username, this.email, this.password, this.phone);

  @override
  List<Object> get props => [username, email, password, phone];
}

class SignOutRequest extends AuthEvent {}

class ResetPasswordRequest extends AuthEvent {
  final String email, password;
  const ResetPasswordRequest(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class OTPRequest extends AuthEvent {
  final String email;
  const OTPRequest(this.email);

  @override
  List<Object> get props => [email];
}

class CheckUser extends AuthEvent {}
