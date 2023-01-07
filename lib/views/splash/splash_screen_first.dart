// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/theme.dart';
import 'package:oranos_app/views/splash/spalsh_screen_second.dart';

class SplashScreenFirstView extends StatefulWidget {
  const SplashScreenFirstView({Key? key}) : super(key: key);

  @override
  State<SplashScreenFirstView> createState() => _SplashScreenFirstViewState();
}

class _SplashScreenFirstViewState extends State<SplashScreenFirstView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash1.png',
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                "assets/images/title.svg",
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                height: 53.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        settings: RouteSettings(name: "book_slot"),
                        builder: (context) => SplashScreenSecondView(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ORANOSTheme.primary),
                  ),
                  child: Text(
                    'Get Started',
                    style: ORANOSTheme.textTheme.headline2!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: ORANOSTheme.textTheme.headline6!.copyWith(),
                      ),
                    ],
                  ),
                  Text(
                    'SignUp',
                    style: ORANOSTheme.textTheme.headline6!.copyWith(
                      color: ORANOSTheme.primary,
                    ),
                  ),
                ],
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
