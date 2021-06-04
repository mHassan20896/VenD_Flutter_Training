import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Widget? child;
  bool? isTrue;
  Loader({this.child, this.isTrue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AbsorbPointer(
      absorbing: isTrue!,
      child: Stack(
        children: [
          child ?? Container(),
          isTrue!
              ? Positioned(
                  left: size.width / 2 - 90,
                  top: size.height / 2 - 45,
                  child: Container(
                    width: 180,
                    height: 90,
                    child: isTrue!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Color(0xff128c7e),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Loading",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          )
                        : Container(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
