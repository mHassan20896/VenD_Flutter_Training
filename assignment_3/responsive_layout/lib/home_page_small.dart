import 'package:flutter/material.dart';
import 'package:responsive_layout/chat_list_page.dart';

class HomeViewSmall extends StatefulWidget {
  const HomeViewSmall({Key? key}) : super(key: key);

  @override
  _HomeViewSmallState createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<HomeViewSmall> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff128c7e),
          title: Text("WantsApp"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("CHAT")),
              Tab(icon: Text("STATUS")),
              Tab(icon: Text("CALLS")),
            ],
          ),
        ),
        body: TabBarView(
          children: [ChatListView(), Container(), Container()],
        ),
      ),
    );
  }
}
