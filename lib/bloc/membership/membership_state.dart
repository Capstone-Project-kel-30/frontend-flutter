part of 'membership_bloc.dart';

abstract class MembershipState extends Equatable {
  const MembershipState();

  @override
  List<Object> get props => [];
}

class LoadingMembershipDetail extends MembershipState {}

class MembershipDetailLoaded extends MembershipState {
  final MembershipModel membership;
  const MembershipDetailLoaded(this.membership);

  @override
  List<Object> get props => [membership];
}

class MembershipError extends MembershipState {
  final String msg;
  const MembershipError(this.msg);

  @override
  List<Object> get props => [msg];
}
