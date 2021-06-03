import 'package:flutter/material.dart';
import 'package:responsive_layout/home_page_large.dart';
import 'package:responsive_layout/home_page_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth < 600) {
          return HomeViewSmall();
        } else {
          return HomeViewLarge();
        }
      }),
    );
  }
}