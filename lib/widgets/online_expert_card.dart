// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/theme.dart';
import 'package:oranos_app/views/chat/chat_screen.dart';

class OnlineExpertCard extends StatelessWidget {
  final Experts? expert;
  const OnlineExpertCard({
    Key? key,
    this.expert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                settings: RouteSettings(name: "book_slot"),
                builder: (context) => ChatScreen(
                  expert: expert,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(expert!.profileImg!),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: ORANOSTheme.successLight,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
