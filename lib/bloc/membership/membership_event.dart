part of 'membership_bloc.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object> get props => [];
}

class GetMembershipDetail extends MembershipEvent {}
