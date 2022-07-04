import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_zone/models/class_model.dart';
import 'package:workout_zone/services/remotes/offline_class_service.dart';

part 'offline_class_event.dart';
part 'offline_class_state.dart';

class OfflineClassBloc extends Bloc<OfflineClassEvent, OfflineClassState> {
  final OfflineClassService offlineClassService;
  OfflineClassBloc(this.offlineClassService) : super(OfflineClassInitial()) {
    on<GetAllOfflineClass>((event, emit) async {
      emit(OfflineClassLoading());
      try {
        final ClassModel offlineClass =
            await offlineClassService.getAllOfflineClass();
        emit(OfflineClassLoaded(offlineClass));
      } catch (e) {
        emit(OfflineClassError(e.toString()));
      }
    });
    on<GetOfflineClassById>((event, emit) async {
      emit(OfflineClassLoading());
      try {
        final String id = event.id;
        final ClassModel offlineClass =
            await offlineClassService.getOfflineClassById(id);
        emit(OfflineClassLoaded(offlineClass));
      } catch (e) {
        emit(OfflineClassError(e.toString()));
      }
    });
  }
}
