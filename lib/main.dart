import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/signin/signin.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
