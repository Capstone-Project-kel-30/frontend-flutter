part of 'membership_payment_bloc.dart';

abstract class MembershipPaymentState extends Equatable {
  const MembershipPaymentState();

  @override
  List<Object> get props => [];
}

class PaymentLoading extends MembershipPaymentState {}

class PaymentRequestSuccess extends MembershipPaymentState {
  final MembershipPaymentModel membershipPayment;
  const PaymentRequestSuccess(this.membershipPayment);

  @override
  List<Object> get props => [membershipPayment];
}

class PaymentRequestError extends MembershipPaymentState {
  final String msg;
  const PaymentRequestError(this.msg);

  @override
  List<Object> get props => [msg];
}
