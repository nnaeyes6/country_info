import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/country_model.dart';
import '../../../data/repository/country_repo.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({required this.countryRepository})
      : super(CountryInitialState()) {
    on<LoadCountryEvent>((event, emit) async {
      emit(CountryLoadingState());
      try {
        List<CountryModel> countryList = await countryRepository.getCountries();
        emit(
          CountryLoadedState(
            countryList: countryList,
            filterStatus: 'Filter',
            languageStatus: 'EN',
          ),
        );
      } catch (error) {
        emit(CountryErrorState(error: error.toString()));
      }
    });
    on<ChangeFilteredEvent>(
      (event, emit) {
        emit((state as CountryLoadedState).copyWith(
          filterStatus: event.filterValue,
        ));
      },
    );
  }

  final CountryRepository countryRepository;
}
