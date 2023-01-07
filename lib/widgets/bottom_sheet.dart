// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/models/services.dart';
import 'package:oranos_app/theme.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    Key? key,
    required this.services,
    required this.controller,
  }) : super(key: key);

  final List<Services> services;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 6.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: ORANOSTheme.borders,
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            ListView.builder(
              controller: controller,
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ORANOSTheme.borders,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16.0),
                            child: SvgPicture.asset(
                              services[index].icon!,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                services[index].title!,
                                style: ORANOSTheme.textTheme.headline4,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  services[index].subTitle!,
                                  style: ORANOSTheme.textTheme.headline6!
                                      .copyWith(color: Colors.grey[500]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //   ),
      // )
    );
  }
}
