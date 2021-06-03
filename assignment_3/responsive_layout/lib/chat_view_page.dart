import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_layout/chat_manager.dart';

class ChatViewPage extends StatefulWidget {
  const ChatViewPage({Key? key}) : super(key: key);

  @override
  _ChatViewPageState createState() => _ChatViewPageState();
}

class _ChatViewPageState extends State<ChatViewPage> {
  TextEditingController? _messageController;
  ChatManager? _chatManager;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _chatManager = ChatManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) {
                return messageTile(i);
              },
              // separatorBuilder: (_,i){
              //   return SizedBox(height: 16);
              // },
              itemCount: _chatManager!.sender.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _chatManager!.send("me", _messageController!.text);
                    });

                    Timer(Duration(seconds: 2), () {
                      setState(() {
                        _chatManager!.send("them", "ok");
                      });
                    });

                    _messageController!.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  backgroundColor: Color(0xff128c7e),
                  child: Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff128c7e),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (Navigator.canPop(context)) backButton(context),
          SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 8),
          Text("Hassan")
        ],
      ),
    );
  }

  backButton(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.arrow_back),
      onTap: () => Navigator.pop(context),
    );
  }

  messageTile(int i) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _chatManager!.sender[i].endsWith("me")
              ? Colors.white
              : Colors.green.shade400),
      margin: EdgeInsets.only(
          left: _chatManager!.sender[i].endsWith("me") ? 30 : 8,
          right: _chatManager!.sender[i].endsWith("me") ? 8 : 30,
          top: 16),
      padding: EdgeInsets.all(16),
      child: Text(
        _chatManager!.message(_chatManager!.sender[i]),
        style: TextStyle(
          color: _chatManager!.sender[i].endsWith("me")
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
