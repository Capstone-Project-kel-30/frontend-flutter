part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUser extends UserEvent {
  final String email, phone, name, password;
  const UpdateUser(
      {required this.email,
      required this.phone,
      required this.name,
      required this.password});
}

class GetUserProfile extends UserEvent {}
