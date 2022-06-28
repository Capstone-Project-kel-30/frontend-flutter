import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/services/remotes/membership_service.dart';

part 'membership_event.dart';
part 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  MembershipService membershipService;
  MembershipBloc(this.membershipService) : super(LoadingMembershipDetail()) {
    on<GetMembershipDetail>((event, emit) async {
      emit(LoadingMembershipDetail());
      try {
        final MembershipModel membership =
            await membershipService.getMembershipDetails();
        emit(MembershipDetailLoaded(membership));
      } catch (e) {
        emit(MembershipError(e.toString()));
      }
    });
  }
}
