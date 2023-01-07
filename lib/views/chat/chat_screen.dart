// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos_app/models/check_box.dart';
import 'package:oranos_app/models/experts.dart';
import 'package:oranos_app/theme.dart';
import 'package:oranos_app/widgets/receiver_message.dart';
import 'package:oranos_app/widgets/sender_message.dart';

class ChatScreen extends StatefulWidget {
  final Experts? expert;
  const ChatScreen({
    Key? key,
    this.expert,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool? isGoing;
  int page = 1;
  bool sendButton = false;
  String? base64Image;
  bool? canCancel;
  final TextEditingController _messageText = TextEditingController(text: '');
  List<CheckBoxState> checkBox = [
    CheckBoxState(
      title: 'Security',
      isChecked: false,
    ),
    CheckBoxState(
      title: 'Supply Chain',
      isChecked: false,
    ),
    CheckBoxState(
      title: 'Information Technology',
      isChecked: false,
    ),
    CheckBoxState(
      title: 'Human Resource',
      isChecked: false,
    ),
    CheckBoxState(
      title: 'Business Research',
      isChecked: false,
    ),
  ];

  List<String> chat = ['Marwan'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.chat.uuid!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ORANOSTheme.primary,
        titleSpacing: 0.0,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.expert!.profileImg!),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.expert!.name!,
                style: ORANOSTheme.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(bottom: 100.0),
        child: GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReceiverMessage(
                  message: 'Hi, Whats You Name Firstname?',
                ),
                SenderMessage(message: 'Abdalla'),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: chat
                          .map(
                            (c) => SenderMessage(message: c),
                          )
                          .toList()),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: checkBox.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          checkBox[index].isChecked =
                              !checkBox[index].isChecked!;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: checkBox[index].isChecked!
                                    ? ORANOSTheme.primary
                                    : ORANOSTheme.borders,
                              ),
                              child: checkBox[index].isChecked!
                                  ? Container(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )
                                  : Container(),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                checkBox[index].title!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ORANOSTheme.borders),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 32.0),
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                controller: _messageText,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                onChanged: (value) {
                  if (value.length > 0) {
                    setState(() {
                      _messageText.text = value;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type a message",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(16.0),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset("assets/icons/Voice 2.svg"),
                    onPressed: () {},
                  ),
                  prefixIcon: IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/world.svg",
                      color: Color(0xFF77838F),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/Send.svg"),
              onPressed: () {
                setState(() {
                  chat.add(_messageText.text);
                  _messageText.text = '';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
