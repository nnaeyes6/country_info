import 'package:country_list_app/core/constants/ktext.dart';
import 'package:country_list_app/features/widgets/country_card.dart';
import 'package:country_list_app/features/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../core/constants/colors.dart';
import '../../data/functions/functions.dart';
import '../../data/models/country_model.dart';
import '../../logic/bloc/bloc/country_bloc.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitialState) {
            return InkWell(
                onTap: () {
                  BlocProvider.of<CountryBloc>(context).add(LoadCountryEvent());
                },
                child: Center(
                  child: SizedBox(
                    height: 400,
                    width: 350,
                    child: Column(
                      children: [
                        const Ktext(
                          text: 'Countries Info',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                        Image.asset('images/european-union.png'),
                        const Ktext(
                          text: 'Open',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ));
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
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isClicked) {
                                Scaffold(
                                  backgroundColor: backgroundColordark,
                                );
                              }
                              Scaffold(
                                backgroundColor: backgroundColorwt,
                              );
                            });
                          },
                          child: Image.asset(
                            'images/sun.png',
                          ),
                        ),
                      ),
                    ]),
                const SearchCountry(),
                const CustomButtons(
                  filterList: [],
                ),
                SliverToBoxAdapter(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Ktext(text: 'A'),
                    ),
                  ],
                )),
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
