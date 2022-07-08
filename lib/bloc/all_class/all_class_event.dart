part of 'all_class_bloc.dart';

abstract class AllClassEvent extends Equatable {
  const AllClassEvent();

  @override
  List<Object> get props => [];
}

class GetAllClass extends AllClassEvent {}

class SearchResult extends AllClassEvent {
  final String query;
  const SearchResult(this.query);

  @override
  List<Object> get props => [query];
}

class FilterClass extends AllClassEvent {
  final List<Class> allClass;
  final bool Function(Class) filter;
  const FilterClass(this.allClass, this.filter);

  @override
  List<Object> get props => [allClass, filter];
}
