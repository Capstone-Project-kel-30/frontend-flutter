part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class GetSchedule extends ScheduleEvent {}

class FilterSchedule extends ScheduleEvent {
  final List<Class> classes;
  final bool Function(Class) filter;
  const FilterSchedule(this.filter, this.classes);

  @override
  List<Object> get props => [filter, classes];
}
