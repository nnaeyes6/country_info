import 'package:country_list_app/features/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../core/constants/colors.dart';
import '../../data/functions/functions.dart';
import '../../data/models/country_model.dart';
import '../../logic/bloc/bloc/country_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitialState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CountryBloc>(context).add(LoadCountryEvent());
                },
                child: const Text('Welcome to Country Info... Click',
                    style: TextStyle(fontSize: 18)),
              ),
            );
          }

          if (state is CountryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CountryLoadedState) {
            List<MapEntry<String, List<CountryModel>>> sortedGroupedList =
                (generateCountryMap(state.filterStatus, state.countryList)
                      ..forEach(
                        (key, value) {
                          value.sort((country1, country2) => generateSorting(
                              state.languageStatus, country1, country2));
                        },
                      ))
                    .entries
                    .toList();

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                    elevation: 0,
                    backgroundColor: backgroundColorwt,
                    title: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: 'Explore',
                            style: TextStyle(
                                fontFamily: 'ElsieSwashCaps',
                                color: exploreIconWtTheme,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 18),
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                                fontFamily: 'ElsieSwashCaps',
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ]))),
                    //   child: const Text(

                    // ),
                    actions: [
                      Container(
                        height: 10,
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'images/sun.png',
                        ),
                      ),
                    ]),
                // const SliverToBoxAdapter(child: SortGroupWidget()),
                MultiSliver(
                  children:
                      buildCountryGroups(gridGroupedList: sortedGroupedList),
                )
              ],
            );
          }
          return const Center();
        },
      ),
    );
  }
}

List<Widget> buildCountryGroups(
        {required List<MapEntry<String, List<CountryModel>>>
            gridGroupedList}) =>
    gridGroupedList
        .map((e) => CountryListCard(groupTitle: e.key, countryList: e.value))
        .toList();
