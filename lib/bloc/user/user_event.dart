part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUser extends UserEvent {
  final String? email, phone, username, password;
  const UpdateUser(this.email, this.phone, this.username, this.password);
}

class GetUserProfile extends UserEvent {}
