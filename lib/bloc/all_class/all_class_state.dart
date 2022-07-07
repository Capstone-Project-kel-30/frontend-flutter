part of 'all_class_bloc.dart';

abstract class AllClassState extends Equatable {
  const AllClassState();

  @override
  List<Object> get props => [];
}

class AllClassInitialState extends AllClassState {}

class AllClassLoading extends AllClassState {}

class AllClassLoaded extends AllClassState {
  final ClassModel allClass;
  const AllClassLoaded(this.allClass);

  @override
  List<Object> get props => [allClass];
}

class AllClassError extends AllClassState {
  final String msg;
  const AllClassError(this.msg);
  @override
  List<Object> get props => [msg];
}

class FilteredClassLoaded extends AllClassState {
  final List<Class> filteredClasses;
  const FilteredClassLoaded(this.filteredClasses);

  @override
  List<Object> get props => [filteredClasses];
}
