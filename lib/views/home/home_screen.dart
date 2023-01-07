// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/data/cubit/home_cubit.dart';
import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/models/services.dart';
import 'package:oranos_app/theme.dart';
import 'package:oranos_app/widgets/online_expert_card.dart';
import 'package:oranos_app/widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Experts> experts = [
    Experts(
      id: 1,
      name: 'Kareem Adel',
      profileImg: 'assets/images/card1.png',
      rating: 4.5,
      title: 'Supply Chain',
      isFavorite: false,
    ),
    Experts(
      id: 1,
      name: 'Merna Adel',
      profileImg: 'assets/images/card2.png',
      rating: 2.3,
      title: 'Supply Chain',
      isFavorite: true,
    ),
    Experts(
      id: 1,
      name: 'Kareem Adel',
      profileImg: 'assets/images/card1.png',
      rating: 3.2,
      title: 'Supply Chain',
      isFavorite: false,
    ),
    Experts(
      id: 1,
      name: 'Merna Adel',
      profileImg: 'assets/images/card2.png',
      rating: 1.5,
      title: 'Supply Chain',
      isFavorite: true,
    ),
  ];
  List<Services> services = [
    Services(
      title: 'Information Technology',
      subTitle: '23 Experts',
      icon: 'assets/icons/Group_114.svg',
    ),
    Services(
      title: 'Supply Chain',
      subTitle: '12 Experts',
      icon: 'assets/icons/Group_115.svg',
    ),
    Services(
      title: 'Security',
      subTitle: '14 Experts',
      icon: 'assets/icons/Group_116.svg',
    ),
    Services(
      title: 'Human Resource',
      subTitle: '14 Experts',
      icon: 'assets/icons/Group_117.svg',
    ),
    Services(
      title: 'Immigration',
      subTitle: '18 Experts',
      icon: 'assets/icons/Group_118.svg',
    ),
    Services(
      title: 'Translation',
      subTitle: '3 Experts',
      icon: 'assets/icons/Group_119.svg',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    experts = BlocProvider.of<HomeCubit>(context).getHomeExperts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .4,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://user-images.githubusercontent.com/30195/34457818-8f7d8c76-ed82-11e7-8474-3825118a776d.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
              width: 20,
            ),
          ),
        ],
        backgroundColor: Color(0xFFF9F9FA),
        iconTheme: IconThemeData(color: Color(0xFF1E4897)),
        title: Column(
          children: [
            SvgPicture.asset("assets/images/title.svg"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Home.svg"), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Star.svg"), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Wallet.svg"), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Search.svg"), label: ''),
      ]),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        // if (state is ExpertsLoaded) {
        // experts = (state).expertsList;
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Recommended Experts',
                            style: ORANOSTheme.textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '...',
                            style: ORANOSTheme.textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ORANOSTheme.placeholders,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: experts
                          .map(
                            (expert) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              width: 185,
                              height: 242,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 151,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(expert.profileImg!),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: ORANOSTheme.warning,
                                              size: 16.0,
                                            ),
                                            Text(
                                                '(${expert.rating.toString()})')
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              expert.isFavorite =
                                                  !expert.isFavorite!;
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: expert.isFavorite!
                                                ? ORANOSTheme.warning
                                                : ORANOSTheme.borders,
                                            size: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Text(
                                      expert.name!,
                                      style: ORANOSTheme.textTheme.headline4!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      expert.title!,
                                      style: ORANOSTheme.textTheme.headline6!
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ORANOSTheme.inactiveStates,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Online Experts',
                            style: ORANOSTheme.textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '...',
                            style: ORANOSTheme.textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ORANOSTheme.placeholders,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: experts
                          .map(
                            (expert) => OnlineExpertCard(
                              expert: expert,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.03,
                minChildSize: 0.03,
                maxChildSize: 0.7,
                builder: (BuildContext context, ScrollController controller) {
                  return BottomSheetBody(
                    services: services,
                    controller: controller,
                  );
                },
              ),
            ],
          ),
        );
      }
          //   else {
          //     Scaffold(
          //       backgroundColor: Colors.white,
          //       body: Center(
          //         child: CircularProgressIndicator(
          //           valueColor:
          //               AlwaysStoppedAnimation<Color>(ORANOSTheme.primary),
          //         ),
          //       ),
          //     );
          //   }
          //   throw ('error');
          // },
          ),
    );
  }
}
