import 'package:api_practice/screens/bloc_screen.dart';
import 'package:api_practice/screens/provider_screen.dart';
import 'package:api_practice/screens/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(

        child: Column(
          children: [

            SizedBox(height: 20,),

            GestureDetector(

              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ProviderScreen()));
              },

              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Provider",
                  textScaleFactor: 1,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),),
              ),
            ),

            SizedBox(height: 20,),

            GestureDetector(

              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const RiverpodScreen()));
              },

              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Riverpod",
                  textScaleFactor: 1,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),),
              ),
            ),

            SizedBox(height: 20,),

            GestureDetector(

              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const BlocScreen()));
              },

              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Bloc",
                  textScaleFactor: 1,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
