import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroundImage(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weather App",
                style: GoogleFonts.lobster(fontSize: 60, color: Colors.white),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AbsorbPointer(
                  child: GestureDetector(
                    onTap: () {},
                    child: customisedTextField(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DecorationImage backgroundImage() {
    return DecorationImage(
      image: AssetImage("assets/wallpaper.jpeg"),
      fit: BoxFit.cover,
    );
  }

  Widget customisedTextField() {
    return TextField(
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: "Type in your text",
        fillColor: Colors.white54,
      ),
    );
  }
}
