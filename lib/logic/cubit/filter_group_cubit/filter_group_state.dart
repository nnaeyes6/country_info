part of 'fiter_group_cubit.dart';

class FilterGroupState extends Equatable {
  const FilterGroupState(
      {required this.filterValue, required this.languageValue});

  final String filterValue;
  final String languageValue;

  @override
  List<Object> get props => [filterValue, languageValue];

  FilterGroupState copyWith({
    String? filterValue,
    String? languageValue,
  }) {
    return FilterGroupState(
      filterValue: filterValue ?? this.filterValue,
      languageValue: languageValue ?? this.languageValue,
    );
  }
}
