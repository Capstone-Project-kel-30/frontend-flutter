part of 'membership_payment_bloc.dart';

abstract class MembershipPaymentEvent extends Equatable {
  const MembershipPaymentEvent();

  @override
  List<Object> get props => [];
}

class MembershipRegisterRequest extends MembershipPaymentEvent {
  final int membershipId;
  const MembershipRegisterRequest(this.membershipId);

  @override
  List<Object> get props => [membershipId];
}

class GetMembershipPaymentInfo extends MembershipPaymentEvent {}
