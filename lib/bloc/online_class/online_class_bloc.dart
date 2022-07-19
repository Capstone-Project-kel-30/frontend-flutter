import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/services/remotes/class_service.dart';

import '../../models/class_model.dart';

part 'online_class_event.dart';
part 'online_class_state.dart';

class OnlineClassBloc extends Bloc<OnlineClassEvent, OnlineClassState> {
  final ClassService classService;
  OnlineClassBloc(this.classService) : super(OnlineClassInitial()) {
    on<GetAllOnlineClass>((event, emit) async {
      emit(OnlineClassLoading());
      try {
        final ClassModel onlineClasses = await classService.getAllOnlineClass();
        emit(OnlineClassLoaded(onlineClasses));
      } catch (e) {
        emit(OnlineClassError(e.toString()));
      }
    });
    on<GetOnlineClassById>((event, emit) async {
      emit(OnlineClassLoading());
      try {
        final String id = event.id;
        final ClassModel onlineClass =
            await classService.getOnlineClassById(id);
        emit(OnlineClassLoaded(onlineClass));
      } catch (e) {
        emit(OnlineClassError(e.toString()));
      }
    });
  }
}
