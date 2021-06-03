import 'package:flutter/material.dart';

class GmailHomePage extends StatefulWidget {
  const GmailHomePage({Key? key}) : super(key: key);

  @override
  _GmailHomePageState createState() => _GmailHomePageState();
}

class _GmailHomePageState extends State<GmailHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: Text(
            "Gmail",
            style: TextStyle(fontSize: 32, color: Colors.red),
          )),
        ),
      ),
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                searchBox(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
                emailPreviewTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  searchBox() {
    return Stack(
      children: [
        TextFormField(
          decoration: new InputDecoration(
            //suffixIcon: CircleAvatar(child: Text("HS"),),
            contentPadding: EdgeInsets.only(left: 45),
            hintText: "Search in emails",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            if (FocusScope.of(context).hasFocus)
              FocusScope.of(context).requestFocus(FocusNode());
          },
          icon: Icon(
            Icons.view_headline_outlined,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  emailPreviewTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text("VD"),
        ),
        title: Text("VentureDive"),
        subtitle: Text("This is a dummy email"),
        trailing: Icon(Icons.star_border),
        hoverColor: Colors.grey,
      ),
    );
  }
}
