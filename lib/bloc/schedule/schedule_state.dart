part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class LoadingSchedule extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final ScheduleInfoModel scheduleInfo;
  const ScheduleLoaded(this.scheduleInfo);
  @override
  List<Object> get props => [scheduleInfo];
}

class FilteredSchedule extends ScheduleState {
  final List<Class> filteredClass;
  const FilteredSchedule(this.filteredClass);

  @override
  List<Object> get props => [filteredClass];
}

class ScheduleError extends ScheduleState {
  final String msg;
  const ScheduleError(this.msg);
  @override
  List<Object> get props => [msg];
}
