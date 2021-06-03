import 'package:flutter/material.dart';
import 'package:responsive_layout/chat_list_page.dart';
import 'package:responsive_layout/chat_view_page.dart';

class HomeViewLarge extends StatefulWidget {
  const HomeViewLarge({ Key? key }) : super(key: key);

  @override
  _HomeViewLargeState createState() => _HomeViewLargeState();
}

class _HomeViewLargeState extends State<HomeViewLarge> {
  bool _chatSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ChatListView(),flex: 3,),
        Expanded(child: rightPanView(), flex: 7,)
      ],
    );
  }

  rightPanView() {
    return ChatViewPage();
    // return this._chatSelected ? ChatViewPage(): Container(color: Colors.grey.shade400,child: Center(child: Text("Opposite of NETWORKING is NOT WORKING"),));
  }
}