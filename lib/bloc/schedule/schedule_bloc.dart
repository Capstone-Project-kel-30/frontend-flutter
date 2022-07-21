import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/models/schedule_info_model.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/locals/user_info_service.dart';
import 'package:workout_zone/services/remotes/membership_service.dart';

import '../../models/class_model.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final MembershipService membershipService;
  final UserInfoService userInfoService;
  ScheduleBloc(
    this.membershipService,
    this.userInfoService,
  ) : super(ScheduleInitial()) {
    on<GetSchedule>((event, emit) async {
      emit(LoadingSchedule());
      try {
        final UserModel user = userInfoService.getUserInfo();
        final String authorization = user.data!.token!;
        final ScheduleInfoModel scheduleInfo =
            await membershipService.userClassSchedule(authorization);
        emit(ScheduleLoaded(scheduleInfo));
      } catch (e) {
        emit(ScheduleError(e.toString()));
      }
    });
    on<FilterSchedule>((event, emit) async {
      final filter = event.filter;
      final classes = event.classes;
      final filteredClass = classes.where(filter).toList();
      emit(FilteredSchedule(filteredClass));
    });
  }
}
