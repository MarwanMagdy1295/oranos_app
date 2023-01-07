// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/data/cubit/home_cubit.dart';
import 'package:oranos_app/repository/experts_repository.dart';
import 'package:oranos_app/services/home_service.dart';
import 'package:oranos_app/theme.dart';
import 'package:oranos_app/views/home/home_screen.dart';

class SplashScreenSecondView extends StatefulWidget {
  const SplashScreenSecondView({Key? key}) : super(key: key);

  @override
  State<SplashScreenSecondView> createState() => _SplashScreenSecondViewState();
}

class _SplashScreenSecondViewState extends State<SplashScreenSecondView> {
  ExpertsRepository? expertsRepository;
  @override
  Widget build(BuildContext context) {
    expertsRepository = ExpertsRepository(HomeService());
    HomeCubit homeCubit = HomeCubit(expertsRepository);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: <Widget>[
                  Positioned(
                    top: 40,
                    right: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Text(
                        "Hi, My name is Oranobot\nI will always be there to\nhelp and assist you.\nSay Start To go to Next.",
                        style: ORANOSTheme.textTheme.headline4!.copyWith(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/splash_title.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/images/oranos.svg"),
              Container(
                margin: EdgeInsets.only(
                    left: 130.0, right: 130.0, bottom: 16, top: 20.0),
                height: 53.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (BuildContext context) => homeCubit,
                          child: HomeScreen(),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ORANOSTheme.primary),
                  ),
                  child: Text(
                    'Next',
                    style: ORANOSTheme.textTheme.headline2!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/icons/world.svg"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'English',
                        style: ORANOSTheme.textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
