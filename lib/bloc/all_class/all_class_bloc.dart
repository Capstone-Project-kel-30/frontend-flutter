import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/class_model.dart';
import '../../services/remotes/class_service.dart';

part 'all_class_event.dart';
part 'all_class_state.dart';

class AllClassBloc extends Bloc<AllClassEvent, AllClassState> {
  final ClassService classService;
  AllClassBloc(this.classService) : super(AllClassInitialState()) {
    on<GetAllClass>((event, emit) async {
      emit(AllClassLoading());
      try {
        ClassModel allClass = await classService.getAllClass();
        emit(AllClassLoaded(allClass));
      } catch (e) {
        emit(AllClassError(e.toString()));
      }
    });
    on<FilterClass>((event, emit) {
      final filter = event.filter;
      final allClass = event.allClass;
      final filteredClass = allClass.where(filter).toList();
      emit(FilteredClassLoaded(filteredClass));
    });
  }
}
