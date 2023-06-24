import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// CETTE PARTIE CONCERNE LES DIFFERENT TAILLE DE LA POLICE
const double appbarTextSize = 22;
const double headingTextSize = 16;
const double textSize = 13;
const double smallTextSize = 11;
const double xsTextSize = 9;

// CETTE PARTIE CONCERNE LES COULEURS DE L'APP
HexColor primaryColor = HexColor("#2979FF");
const secondaryColor = Color(0xFF1E88E5);
const textColorImportant = Color.fromARGB(255, 44, 154, 245);

//defaul color
const white = Colors.white;
const black = Colors.black;
Color grey = Colors.grey;
Color grey1 = Colors.grey.shade400;
Color grey2 = Colors.grey.shade700;
Color bgColor = grey;

Icon icon(IconData iconData, {color = black, double iconSize = 22}) {
  return Icon(
    iconData,
    size: iconSize,
    color: color,
  );
}

// transition values
const transitionAnimate = 50;

// Font app
Text customeTextStyle(String text, Color color,
  {FontWeight fontWeight = FontWeight.normal,
  double size = 14,
  double letterSpace = 0.5,
  TextAlign align = TextAlign.start}) {
  return Text(
    text,
    textAlign: align,
    style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        letterSpacing: letterSpace,
        fontWeight: fontWeight),
  );
}

// padding and margin
const padding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
const margin = EdgeInsets.all(15);




void messageBox(BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 60,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: customeTextStyle(message, white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        )
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    )
  );
}

void messageBoxSuccess(BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 60,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: customeTextStyle(message, white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        )
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    )
  );
}


String formatDateString(String dateString) {
  initializeDateFormatting('fr_FR', null); // Initialisation des données de localisation pour le français
  DateTime dateObjet = DateFormat('yyyy-MM-dd').parse(dateString);
  String dateFormatee = DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(dateObjet);
  return dateFormatee;
}

String formatRelativeTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'il y a ${difference.inSeconds} secondes';
  } else if (difference.inMinutes < 60) {
    return 'il y a ${difference.inMinutes} minutes';
  } else if (difference.inHours < 24) {
    return 'il y a ${difference.inHours} heures';
  } else if (difference.inDays < 30) {
    return 'il y a ${difference.inDays} jours';
  } else {
    final months = difference.inDays ~/ 30;
    return 'il y a $months mois';
  }
}
