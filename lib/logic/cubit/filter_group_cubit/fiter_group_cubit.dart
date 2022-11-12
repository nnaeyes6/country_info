import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_group_state.dart';

class FilterGroupCubit extends Cubit<FilterGroupState> {
  FilterGroupCubit()
      : super(const FilterGroupState(
          filterValue: 'Name',
          languageValue: 'Ungrouped',
        ));

  void onChangeFilterOption(String newValue) {
    emit(state.copyWith(filterValue: newValue));
  }

  void onChangeLanguageOption(String newValue) {
    emit(state.copyWith(languageValue: newValue));
  }
}
