import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/models/book_info_model.dart';
import 'package:workout_zone/services/locals/user_info_service.dart';
import 'package:workout_zone/services/remotes/membership_service.dart';

import '../../models/user_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final MembershipService membershipService;
  final UserInfoService userInfoService;
  BookingBloc(this.membershipService, this.userInfoService)
      : super(BookingInitial()) {
    on<BookingRequest>((event, emit) async {
      emit(BookingLoading());
      try {
        final UserModel userModel = userInfoService.getUserInfo();
        final User user = userModel.data!;
        final String authorization = user.token!;
        final int userId = event.userId;
        final int classId = event.classId;
        final BookInfoModel bookInfo = await membershipService.bookingClass(
          userId: userId,
          classId: classId,
          authorization: authorization,
        );
        emit(BookingSuccess(bookInfo, user));
      } catch (e) {
        emit(BookingFailed(e.toString()));
      }
    });
  }
}
