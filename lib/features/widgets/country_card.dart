// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:country_list_app/features/screens/country_details.dart';

import '../../core/constants/colors.dart';
import '../../data/models/country_model.dart';

class CountryListCard extends StatelessWidget {
  const CountryListCard({
    Key? key,
    required this.groupTitle,
    required this.countryList,
  }) : super(key: key);

  final String groupTitle;
  final List<CountryModel> countryList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: countryList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const CountryDetails();
              }));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 2,
                color: textfeildBTNColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Wrap(alignment: WrapAlignment.start, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        countryList[index].flagPng,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          countryList[index].nameCommon,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          countryList[index].capital,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


//  child: ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: countryList.length,
//         scrollDirection: Axis.vertical,
//         itemBuilder: ((context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return const CountryDetails();
//               }));
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               child: Card(
//                 elevation: 2,
//                 color: textfeildBTNColor,
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   height: 50,
//                   child: Wrap(alignment: WrapAlignment.start, children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(
//                         countryList[index].flagPng,
//                         height: 50,
//                         width: 50,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           countryList[index].nameCommon,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontSize: 12),
//                         ),
//                         Text(
//                           countryList[index].capital,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ]),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
  