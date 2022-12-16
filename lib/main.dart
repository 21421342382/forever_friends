import 'package:flutter/material.dart';
import 'package:friendsforever/splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const engine());
}

class engine extends StatelessWidget {
  const engine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: splash(),
      ),
    );
  }
}
