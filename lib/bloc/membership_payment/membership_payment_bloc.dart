import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/membership_payment_model.dart';
import '../../services/locals/user_info_service.dart';
import '../../services/remotes/membership_service.dart';

part 'membership_payment_event.dart';
part 'membership_payment_state.dart';

class MembershipPaymentBloc
    extends Bloc<MembershipPaymentEvent, MembershipPaymentState> {
  MembershipService membershipService;
  UserInfoService userInfoService;
  MembershipPaymentBloc(
    this.membershipService,
    this.userInfoService,
  ) : super(PaymentLoading()) {
    on<MembershipRegisterRequest>((event, emit) async {
      emit(PaymentLoading());
      try {
        final currentUser = userInfoService.getUserInfo();
        final String authorization = currentUser.data!.token!;
        final int membershipId = event.membershipId;
        final MembershipPaymentModel membershipPayment =
            await membershipService.membershipRegister(
          membershipId: membershipId,
          authorization: authorization,
        );
        await userInfoService.updateUserInfo(
          memberType: membershipPayment.data!.membership!.type!,
        );
        emit(PaymentRequestSuccess(membershipPayment));
      } catch (e) {
        emit(PaymentRequestError(e.toString()));
      }
    });
    on<GetMembershipPaymentInfo>((event, emit) async {
      emit(PaymentLoading());
      try {
        final currentUser = userInfoService.getUserInfo();
        final String authorization = currentUser.data!.token!;
        final MembershipPaymentModel membershipPayment =
            await membershipService.membershipPaymentInfo(authorization);
        emit(PaymentRequestSuccess(membershipPayment));
      } catch (e) {
        emit(PaymentRequestError(e.toString()));
      }
    });
  }
}
