import 'package:flutter/material.dart';

import 'chat_view_page.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, i) => chatPreviewTile(context),
        separatorBuilder: (_, i) => Divider(),
        itemCount: 4);
  }

  chatPreviewTile(BuildContext context) {
    return ListTile(
      onTap: () {
        if(MediaQuery.of(context).size.width<600) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatViewPage()));
        }
      },
      leading: CircleAvatar(child: Text("TA")),
      title: Text(
        "Hassan",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      subtitle: Text("Hi"),
    );
  }
}
