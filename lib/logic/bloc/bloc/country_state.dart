// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_bloc.dart';

@immutable
abstract class CountryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CountryInitialState extends CountryState {
  @override
  List<Object?> get props => [];
}

class CountryLoadingState extends CountryState {
  @override
  List<Object?> get props => [];
}

class CountryLoadedState extends CountryState {
  CountryLoadedState({
    required this.countryList,
    required this.filterStatus,
    required this.languageStatus,
  });

  final List<CountryModel> countryList;

  final String filterStatus;
  final String languageStatus;

  @override
  List<Object?> get props => [countryList, filterStatus];

  CountryLoadedState copyWith({
    List<CountryModel>? countryList,
    String? filterStatus,
    String? languageStatus,
  }) {
    return CountryLoadedState(
      countryList: countryList ?? this.countryList,
      filterStatus: filterStatus ?? this.filterStatus,
      languageStatus: languageStatus ?? this.languageStatus,
    );
  }
}

class CountryErrorState extends CountryState {
  CountryErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
