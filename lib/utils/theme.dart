import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// CETTE PARTIE CONCERNE LES DIFFERENT TAILLE DE LA POLICE
const double bigTextSize = 50;
const double bigTextSize0 = 45;
const double bigTextSize1 = 40;
const double bigTextSize2 = 35;
const double bigTextSize3 = 30;
const double bigTextSize4 = 28;
const double bigTextSize5 = 26;
const double appbarTextSize = 25;
const double headingTextSize = 17;
const double textSizeH2 = 15;
const double textSize = 13;
const double smallTextSize = 11.5;
const double xsTextSize = 10;
const double iconSize = 22;

// CETTE PARTIE CONCERNE LES COULEURS DE L'APP
const primaryColor = Color(0xFF1976D2);
const secondaryColor = Color(0xFF1E88E5);
const textColor = Color(0xFF263238);
const textColorImportant = Color.fromARGB(255, 44, 154, 245);
const bgColor = Color(0xFFFAFAFA);

//defaul color
const white = Colors.white;
const black = Colors.black;
const grey = Color(0xFFBDBDBD);
const grey2 = Color(0xFF858585);

//orther colors
const starColor = Colors.amber;
const bgContainerColor = Color.fromARGB(255, 218, 229, 248);

// transition values
const transitionAnimate = 500;

// Font app
Text bigTextStyle(String text, double size, Color color){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: color,
      fontSize: size,
      letterSpacing: 1,
      fontWeight: FontWeight.bold
    ),
  );
}

Text appbarTextStyle(String text){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: black,
      fontSize: appbarTextSize,
      letterSpacing: 1
    ),
  );
}

Text defaultTextStyle(String text){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: black,
      fontSize: textSize,
      letterSpacing: 1
    ),
  );
}

Text titleTextStyle(String text){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: black,
      fontSize: textSize,
      letterSpacing: 1
    ),
  );
}

Text subtitleTextStyle(String text){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: black,
      fontSize: textSize,
      letterSpacing: 1
    ),
  );
}

Text customeTextStyle(String text, double size, Color color, {FontWeight fontWeight = FontWeight.normal}){
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: color,
      fontSize: size,
      letterSpacing: 1,
      fontWeight: fontWeight
    ),
  );
}


// SPACING BEETWEEN APP
const spacingHeight = SizedBox(height: 10);
const spacingHeight1 = SizedBox(height: 15);
const spacingHeight2 = SizedBox(height: 20);
const spacingHeight3 = SizedBox(height: 25);
const spacingHeight4 = SizedBox(height: 30);
const spacingHeight5 = SizedBox(height: 40);
const spacingWidth = SizedBox(width: 10);
const spacingWidth1 = SizedBox(width: 15);
const spacingWidth2 = SizedBox(width: 20);
const spacingWidth3 = SizedBox(width: 25);
const spacingWidth4 = SizedBox(width: 30);
const spacingWidth5 = SizedBox(width: 40);

// padding and margin
const padding = EdgeInsets.all(15);
const margin = EdgeInsets.all(15);
