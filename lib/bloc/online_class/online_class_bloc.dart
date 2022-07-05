import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/services/remotes/online_class_service.dart';

import '../../models/class_model.dart';

part 'online_class_event.dart';
part 'online_class_state.dart';

class OnlineClassBloc extends Bloc<OnlineClassEvent, OnlineClassState> {
  final OnlineClassService onlineClassService;
  OnlineClassBloc(this.onlineClassService) : super(OnlineClassInitial()) {
    on<GetAllOnlineClass>((event, emit) async {
      emit(OnlineClassLoading());
      try {
        final ClassModel onlineClass =
            await onlineClassService.getAllOnlineClass();
        emit(OnlineClassLoaded(onlineClass));
      } catch (e) {
        emit(OnlineClassError(e.toString()));
      }
    });
    on<GetOnlineClassById>((event, emit) async {
      emit(OnlineClassLoading());
      try {
        final String id = event.id;
        final ClassModel onlineClass =
            await onlineClassService.getOnlineClassById(id);
        emit(OnlineClassLoaded(onlineClass));
      } catch (e) {
        emit(OnlineClassError(e.toString()));
      }
    });
  }
}
