// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_bloc.dart';

@immutable
abstract class CountryEvent extends Equatable {
  const CountryEvent();
}

class LoadCountryEvent extends CountryEvent {
  @override
  List<Object?> get props => [];
}

class ChangeFilteredEvent extends CountryEvent {
  const ChangeFilteredEvent({
    required this.filterValue,
    required this.languageValue,
  });

  final String filterValue;
  final String languageValue;
  @override
  List<Object?> get props => [filterValue];
}
