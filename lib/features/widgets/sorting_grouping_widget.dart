import 'package:country_list_app/core/constants/constant_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/bloc/country_bloc.dart';
import '../../logic/cubit/filter_group_cubit/fiter_group_cubit.dart';

class SortGroupWidget extends StatelessWidget {
  const SortGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterGroupCubit, FilterGroupState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 10),
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildDropDownButton('sort', context, state),
              buildDropDownButton('group', context, state),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CountryBloc>(context).add(
                    ChangeFilteredEvent(
                      filterValue: state.filterValue,
                      languageValue: state.languageValue,
                    ),
                  );
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }

  buildDropDownButton(
      String type, BuildContext context, FilterGroupState state) {
    switch (type) {
      case 'sort':
        return Column(
          children: [
            const Text('Sorted By', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: state.filterValue,
              items: ApiConstants.filterItem.map(buildMenuItem).toList(),
              onChanged: (value) {
                BlocProvider.of<FilterGroupCubit>(context)
                    .onChangeFilterOption(value!);
              },
            ),
          ],
        );
      case 'group':
        return Column(
          children: [
            const Text('Grouped By', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: state.filterValue,
              items: ApiConstants.filterItem.map(buildMenuItem).toList(),
              onChanged: (value) {
                BlocProvider.of<FilterGroupCubit>(context)
                    .onChangeLanguageOption(value!);
              },
            ),
          ],
        );
    }
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
