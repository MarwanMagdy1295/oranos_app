// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/theme.dart';

class ReceiverMessage extends StatelessWidget {
  final String? message;
  const ReceiverMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SvgPicture.asset("assets/icons/receive_icon.svg")),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            margin: EdgeInsets.only(
              bottom: 8.0,
            ),
            decoration: BoxDecoration(
              color: ORANOSTheme.placeholders,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                message ?? "",
                style: ORANOSTheme.textTheme.headline4,
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       child: Text(
          //         message!.createdDate == null
          //             ? ""
          //             : DateFormat('MMMM dd - H:mm')
          //                 .format(message!.createdDate!),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
